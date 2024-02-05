#!/usr/bin/python
from flask import Flask, render_template, request, redirect, url_for, session, flash, jsonify, json

from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import uuid
import bcrypt

# import time
# from pyModbusTCP.client import ModbusClient

# # init
# plc_1 = ModbusClient(host='192.168.1.2', port=502, auto_open=True, debug=False)
# plc_2 = ModbusClient(host='192.168.1.3', port=502, auto_open=True, debug=False)
# plc_3 = ModbusClient(host='192.168.1.4', port=502, auto_open=True, debug=False)
# bit = True

# def double_run_motor_cw():
# 	run_motor1 = plc_2.write_single_coil(3072, 1)
# 	run_motor2 = plc_3.write_single_coil(3072, 1)
# 	#if run_motor1:
# 	#	print('coil #%s: write to %s' % (3072, 1))
# 	#else:
# 	#	print('coil #%s: unable to write %s' % (3072, bit))
# 	#if run_motor2:
# 	#	print('coil #%s: write to %s' % (3072, 1))
# 	#else:
# 	#	print('coil #%s: unable to write %s' % (3072, bit))
# 	time.sleep(15)
# 	run_motor1 = plc_2.write_single_coil(3072, 0)
# 	run_motor2 = plc_3.write_single_coil(3072, 0)
# #	if run_motor1:
# #		print('coil #%s: write to %s' % (3072, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3072, bit))
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3072, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3072, bit))
# 	time.sleep(0.5)

# def double_run_motor_ccw():
# 	run_motor1 = plc_2.write_single_coil(3073, 1)
# 	run_motor2 = plc_3.write_single_coil(3073, 1)
# #	if run_motor1:
# #		print('coil #%s: write to %s' % (3073, 1))
# #	else:
# #		print('coil #%s: unable to write %s' % (3073, bit))
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3073, 1))
# #	else:
# #		print('coil #%s: unable to write %s' % (3073, bit))
# 	time.sleep(15)
# 	run_motor1 = plc_2.write_single_coil(3073, 0)
# 	run_motor2 = plc_3.write_single_coil(3073, 0)
# #	if run_motor1:
# #		print('coil #%s: write to %s' % (3073, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3073, bit))
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3073, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3073, bit))
# 	time.sleep(0.5)

# def plc3_run_motor_cw():
# 	run_motor2 = plc_3.write_single_coil(3074, 1)
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3074, 1))
# #	else:
# #		print('coil #%s: unable to write %s' % (3074, bit))
# 	time.sleep(8)
# 	run_motor2 = plc_3.write_single_coil(3074, 0)
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3074, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3074, bit))
# 	time.sleep(0.5)
	
# def plc3_run_motor_ccw():
# 	run_motor2 = plc_3.write_single_coil(3075, 1)
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3075, 1))
# #	else:
# #		print('coil #%s: unable to write %s' % (3075, bit))
# 	time.sleep(8)
# 	run_motor2 = plc_3.write_single_coil(3075, 0)
# #	if run_motor2:
# #		print('coil #%s: write to %s' % (3075, 0))
# #	else:
# #		print('coil #%s: unable to write %s' % (3075, bit))
# 	time.sleep(0.5)
    
app = Flask(__name__)

app.secret_key = '42311dfstwer234huy456efwr234t2345gdft42345235'


app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'galang'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'server'


mysql = MySQL(app)


@app.route('/')

@app.route("/dashboard")
def dashboard():
	if 'loggedin' in session:
		print(session)
		return render_template("dashboard.html")
	return redirect(url_for('login'))

@app.route("/index")
def index():
	if 'loggedin' in session:
		return render_template("search.html")
	return redirect(url_for('login'))


@app.route('/login', methods =['GET', 'POST'])
def login():
    msg = ''
    _login = 0
    if 'loggedin' in session:
        return render_template('dashboard.html')
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
        account = cursor.fetchone()
        if account and bcrypt.checkpw(password.encode('utf-8'), account['password'].encode('utf-8')):
            session['loggedin'] = True
            session['id'] = account['id']
            session['is_super_admin']=account['is_super_admin']
            session['username'] = account['username']
            _login = 0
            cursor.execute('INSERT INTO update_history SET username =% s, information =%s', (username,"Login"))
            mysql.connection.commit()
            # print(account)
            return render_template('dashboard.html')
        else:
            _login = 1
            msg = 'Username password salah !'
    return render_template('login.html', msg = msg, _login=_login)

@app.route('/logout')
def logout():
    username = session.get('username')  # Menggunakan session.get() untuk menghindari KeyError
    if username:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('INSERT INTO update_history SET username = %s, information = %s', (username, "Logout"))
        mysql.connection.commit()

    # Hapus semua data session
    session.clear()

    return redirect(url_for('login'))

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['user']
        password = request.form['pass'].encode('utf-8')
        hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
        email = request.form['email']
        organisation = request.form['organisation']
        address = request.form['address']
        city = request.form['city']
        state = request.form['state']
        country = request.form['country']
        postalcode = request.form['postalcode']
        pin = request.form['pin']
        user = session.get('username')

        if not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            flash('Alamat email harus sesuai format, contoh@example.com', 'error')
        elif not re.match(r'[A-Za-z0-9]+', username):
            flash('Nama hanya boleh mengandung karakter huruf dan angka', 'error')
        else:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = %s', (username,))
            account = cursor.fetchone()
            if account:
                flash('Data sudah ada. Gunakan Username yang lain.', 'error')
            else:
                
                cursor.execute('INSERT INTO update_history SET username = %s, information = %s', (user, "Register Account"))
                cursor.execute(
                    'INSERT INTO accounts VALUES (NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, 0)',
                    (username, hashed_password, email, organisation, address, city, state, country, postalcode, pin)
                )
                mysql.connection.commit()
                flash('Data pengguna berhasil ditambahkan', 'success')
                request.form = {}

    return render_template('register.html')


# fungsi untuk update data accaount
@app.route("/update", methods=['GET', 'POST'])
def update():
   
    if 'loggedin' in session:
        update_type = request.args.get('update_type', '')  # Mendapatkan nilai "update_type" dari parameter URL
       
        if request.method == 'POST':
            _update_type = request.form['update_type']
            
            username = request.form['username']
            email = request.form['email']
            organisation = request.form['organisation']
            address = request.form['address']
            city = request.form['city']
            state = request.form['state']
            country = request.form['country']
            postalcode = request.form['postalcode']
            pin = request.form['pin']
            update_id = request.form['id']  # Ambil nilai 'id' dari atribut 'hide'
            user = session.get('username')

            # Periksa apakah password baru diinput
            new_password = request.form['password']
            if new_password:
                # Jika password baru diinput, enkripsi password
                password = new_password.encode('utf-8')
                hashed_password = bcrypt.hashpw(password, bcrypt.gensalt())
                
                # Perbarui data termasuk password baru
                cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                cursor.execute('INSERT INTO update_history SET username = %s, information = %s', (user, "Update Account"))
                cursor.execute('UPDATE accounts SET username = %s, password = %s, email = %s, organisation = %s, address = %s, city = %s, state = %s, country = %s, postalcode = %s, pin = %s WHERE id = %s', 
                               (username, hashed_password, email, organisation, address, city, state, country, postalcode, pin, update_id))

                mysql.connection.commit()
                flash('Data berhasil diperbarui!')
                
            else:
                # Jika password tidak diubah, perbarui data kecuali password
                cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                cursor.execute('INSERT INTO update_history SET username = %s, information = %s', (user, "Register Account"))
                cursor.execute('UPDATE accounts SET username = %s, email = %s, organisation = %s, address = %s, city = %s, state = %s, country = %s, postalcode = %s, pin = %s WHERE id = %s', 
                               (username, email, organisation, address, city, state, country, postalcode, pin, update_id))
                mysql.connection.commit()
                flash('Data berhasil diperbarui!')
                
                
           # Setelah berhasil memperbarui data, arahkan kembali ke halaman update dengan inputan sebelumnya
            return redirect(url_for('update', update_type=_update_type, account_id=update_id))

            
        if update_type == 'edit-personal':
            # dari menu update account
            
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE id = %s', (session['id'], ))
            account = cursor.fetchone()
            account['update_type'] = update_type
            # print(account)
            return render_template("update.html", account=account)
        elif update_type == 'edit-account':
            # Anda mungkin perlu mengganti 'session['id']' dengan 'update_id' di bawah ini
            # dari list data account
            account_id = request.args.get("account_id")
            
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE id = %s', (account_id, ))
            account = cursor.fetchone()
            account['update_type'] = update_type
            
            # print(account)
            return render_template("update.html", account=account)
        
    return redirect(url_for('login'))

#Menampilkan data Account by id
@app.route("/display")
def display():
	if 'loggedin' in session:
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM accounts WHERE id = % s', (session['id'], ))
		account = cursor.fetchone()
		#print(account)
		return render_template("display.html", account = account)
	return redirect(url_for('login'))

@app.route("/document_option")
def document_option():
	if 'loggedin' in session:
		tombol = request.args.get('tombol')
		id_user = session['username']
		id_dokumen = session.get('id_dokumen', None)
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
		list_dokumen = cursor.fetchone()
		if tombol == 'tombol1':
			cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
			if (cursor.fetchone()['status_option'] == int(0)) :
				cursor.execute('INSERT INTO search_history SET username=% s, search_keyword =% s, information =%s', ( id_user , list_dokumen['nama_dokumen'], "Take"))
				cursor.execute('UPDATE list_dokumen SET status_option =% s WHERE id_dokumen= %s', (1, list_dokumen['id_dokumen']))
				mysql.connection.commit()
				return redirect(url_for('buka'))
			else:
				msg = '*Dokumen sudah di ambil silahkan melakukan pengembalian terlebih dahulu'
				return render_template("document_option.html", list_dokumen = list_dokumen,msg = msg )
		elif tombol == 'tombol2':
			cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
			if (cursor.fetchone()['status_option'] == int(1)):
				cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
				cursor.execute('INSERT INTO search_history SET username=% s, search_keyword =% s, information =%s', ( id_user , list_dokumen['nama_dokumen'], "Restore"))
				cursor.execute('UPDATE list_dokumen SET status_option =% s WHERE id_dokumen= %s', (0, list_dokumen['id_dokumen']))
				mysql.connection.commit()
				return redirect(url_for('buka'))
			else:
				msg = '*Dokumen sudah di kembalikan silahkan melakukan pengambilan'
				return render_template("document_option.html", list_dokumen = list_dokumen,msg = msg )
		return render_template("document_option.html", list_dokumen = list_dokumen )
	return redirect(url_for('login'))

@app.route("/buka",  methods =['GET', 'POST'])
def buka():
	if 'loggedin' in session:
		id_dokumen = session.get('id_dokumen', None)
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
		list_dokumen = cursor.fetchone()
		if request.method == 'POST' and 'pin_pintu' in request.form:
			pin_pintu = request.form['pin_pintu']
			id_user = session['id']
			cursor.execute('SELECT PIN FROM accounts WHERE id = % s', (id_user, ))
			if (cursor.fetchone()['PIN'] == int(pin_pintu)):
				id = uuid.uuid1().hex
				id = id[0:10]
				session['id_trans'] = id
				cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
				cursor.execute('INSERT INTO data_trans SET id_dokumen =% s, username=% s', (id_dokumen, id_user))
				cursor.execute('UPDATE door_locks SET status_pintu=% s WHERE device_ke= %s AND rak_ke= %s', (1, list_dokumen['device_ke'], list_dokumen['rak_ke']))
				cursor.execute('UPDATE list_dokumen SET status_document=% s WHERE id_dokumen= %s', (1, list_dokumen['id_dokumen']))
				mysql.connection.commit()
				# if (list_dokumen['device_ke'] == int(1)) and (list_dokumen['rak_ke'] == int(1)) :
				# 	ex_lamp_1 = plc_1.write_single_coil(3091, 1)
				# 	double_run_motor_cw()
				# 	door_lock_1 = plc_1.write_single_coil(3076, 1)
				# 	rak_lamp_1 = plc_1.write_single_register(512, int(list_dokumen['device_ke']))
				# 	rak_lamp_1 = plc_1.write_single_register(513, int(list_dokumen['rak_ke']))
				# 	rak_lamp_1 = plc_1.write_single_register(514, int(list_dokumen['baris_ke']))
				# 	rak_lamp_1 = plc_1.write_single_register(515, int(list_dokumen['kolom_ke']))
					
				# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(1)) :
				# 	ex_lamp_21 = plc_2.write_single_coil(3101, 1)
				# 	double_run_motor_cw()
				# 	door_lock_21 = plc_2.write_single_coil(3076, 1)
				# 	rak_lamp_21 = plc_2.write_single_register(512, int(list_dokumen['device_ke']))
				# 	rak_lamp_21 = plc_2.write_single_register(513, int(list_dokumen['rak_ke']))
				# 	rak_lamp_21 = plc_2.write_single_register(514, int(list_dokumen['baris_ke']))
				# 	rak_lamp_21 = plc_2.write_single_register(515, int(list_dokumen['kolom_ke']))

				# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(2)) :
				# 	ex_lamp_22 = plc_2.write_single_coil(3102, 1)
				# 	plc3_run_motor_cw()
				# 	door_lock_22 = plc_2.write_single_coil(3077, 1)
				# 	rak_lamp_22 = plc_2.write_single_register(512, int(list_dokumen['device_ke']))
				# 	rak_lamp_22 = plc_2.write_single_register(513, int(list_dokumen['rak_ke']))
				# 	rak_lamp_22 = plc_2.write_single_register(514, int(list_dokumen['baris_ke']))
				# 	rak_lamp_22 = plc_2.write_single_register(515, int(list_dokumen['kolom_ke']))
					
				# elif(list_dokumen['device_ke'] == int(3)) and (list_dokumen['rak_ke'] == int(1)) :
				# 	ex_lamp_3 = plc_3.write_single_coil(3091, 1)
				# 	plc3_run_motor_cw()
				# 	door_lock_3 = plc_3.write_single_coil(3076, 1)
				# 	rak_lamp_3 = plc_3.write_single_register(512, int(list_dokumen['device_ke']))
				# 	rak_lamp_3 = plc_3.write_single_register(513, int(list_dokumen['rak_ke']))
				# 	rak_lamp_3 = plc_3.write_single_register(514, int(list_dokumen['baris_ke']))
				# 	rak_lamp_3 = plc_3.write_single_register(515, int(list_dokumen['kolom_ke']))
					
				return redirect(url_for('tutup'))
			else :
				msg = '*Pin yang anda masukkan salah'
				return render_template("buka.html", msg = msg, list_dokumen = list_dokumen)
		return render_template("buka.html", list_dokumen = list_dokumen)

@app.route("/tutup", methods = ['GET', 'POST'])
def tutup():
	id_user = session['id']
	if 'loggedin' in session:
		id_dokumen = session.get('id_dokumen', None)
		
		cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
		cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
		list_dokumen = cursor.fetchone()
		if request.method == 'POST':
			cursor.execute("SELECT id_transaksi FROM data_trans order by id_transaksi desc LIMIT 1")
			data1 = cursor.fetchone()
			cursor.execute('UPDATE data_trans SET status_dev1 =% s, status_dev2=% s, status_dev3 =% s WHERE id_transaksi=%s' , (1,1,1, data1['id_transaksi']))
			cursor.execute('UPDATE door_locks SET status_pintu=% s WHERE device_ke= %s AND rak_ke= %s', (0, list_dokumen['device_ke'], list_dokumen['rak_ke']))
			cursor.execute('UPDATE list_dokumen SET status_document=% s WHERE id_dokumen= %s', (0, list_dokumen['id_dokumen']))
			mysql.connection.commit()
			session.pop('id_dokumen', None)
			session.pop('id_trans', None)
			# if (list_dokumen['device_ke'] == int(1)) and (list_dokumen['rak_ke'] == int(1)) :
			# 	rak_lamp_off1 = plc_1.write_single_register(512, 0)
			# 	rak_lamp_off1 = plc_1.write_single_register(513, 0)
			# 	rak_lamp_off1 = plc_1.write_single_register(514, 0)
			# 	rak_lamp_off1 = plc_1.write_single_register(515, 0)
			# 	door_lock_1 = plc_1.write_single_coil(3076, 0)
			# 	double_run_motor_ccw()
			# 	ex_lamp_1 = plc_1.write_single_coil(3091, 0)				
				
			# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(1)) :
			# 	rak_lamp_off21 = plc_2.write_single_register(512, 0)
			# 	rak_lamp_off21 = plc_2.write_single_register(513, 0)
			# 	rak_lamp_off21 = plc_2.write_single_register(514, 0)
			# 	rak_lamp_off21 = plc_2.write_single_register(515, 0)
			# 	door_lock_21 = plc_2.write_single_coil(3076, 0)
			# 	double_run_motor_ccw()
			# 	ex_lamp_22 = plc_2.write_single_coil(3101, 0)
				
			# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(2)) :
			# 	rak_lamp_off22 = plc_2.write_single_register(512, 0)
			# 	rak_lamp_off22 = plc_2.write_single_register(513, 0)
			# 	rak_lamp_off22 = plc_2.write_single_register(514, 0)
			# 	rak_lamp_off22 = plc_2.write_single_register(515, 0)
			# 	door_lock_22 = plc_2.write_single_coil(3077, 0)
			# 	plc3_run_motor_ccw()
			# 	ex_lamp_22 = plc_2.write_single_coil(3102, 0)
				
			# elif(list_dokumen['device_ke'] == int(3)) and (list_dokumen['rak_ke'] == int(1)) :
			# 	rak_lamp_off3 = plc_3.write_single_register(512, 0)
			# 	rak_lamp_off3 = plc_3.write_single_register(513, 0)
			# 	rak_lamp_off3 = plc_3.write_single_register(514, 0)
			# 	rak_lamp_off3 = plc_3.write_single_register(515, 0)
			# 	door_lock_3 = plc_3.write_single_coil(3076, 0)
			# 	plc3_run_motor_ccw()
			# 	ex_lamp_3 = plc_3.write_single_coil(3091, 0)
				
			return redirect(url_for('search'))
		return render_template("tutup.html", list_dokumen = list_dokumen, msg = "Silahkan tunggu cabinet melakukan permintaan")
	return redirect(url_for('login'))


@app.route("/search_user", methods =['GET', 'POST'])
def search_user():
    status_update = 0;
    if 'loggedin' in session:
        if request.method == 'POST' and 'username' in request.form:
            username = request.form['username']
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = % s', (username, ))
            account = cursor.fetchone()
            if account:
                return render_template("update.html", account = account)
            flash('Data tidak ditemukan')
            return render_template("search_user.html")
        msg = "Data tidak boleh kosong"    
        return render_template("search_user.html", msg = msg)
    return redirect(url_for('login'))


@app.route("/search", methods =['GET', 'POST'])
def search():
	msg_search = ''
	
	if 'loggedin' in session:
		if request.method == 'POST' and 'nama_dokumen' in request.form:
			id_user = session['username']
			cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
			cursor.execute('SELECT PIN FROM accounts WHERE username = % s', (id_user, ))
			try:
				nama_dokumen = request.form['nama_dokumen']
				cursor.execute('SELECT id_dokumen FROM list_dokumen WHERE nama_dokumen = % s', (nama_dokumen, ))
				id_dokumen = cursor.fetchone()['id_dokumen']
				session['id_dokumen'] = id_dokumen
				cursor.execute('SELECT * FROM list_dokumen WHERE id_dokumen = % s', (id_dokumen, ))
				list_dokumen = cursor.fetchone()
				if (list_dokumen['status_option'] == int(0)) and (list_dokumen['status_document'] == int(1)) :
					cursor.execute('UPDATE list_dokumen SET status_option =% s WHERE id_dokumen= %s', (1, list_dokumen['id_dokumen']))
					# if (list_dokumen['device_ke'] == int(1)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off1 = plc_1.write_single_register(512, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(513, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(514, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(515, 0)
					# 	door_lock_1 = plc_1.write_single_coil(3076, 0)
					# 	double_run_motor_ccw()
					# 	ex_lamp_1 = plc_1.write_single_coil(3091, 0)				
				
					# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off21 = plc_2.write_single_register(512, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(513, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(514, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(515, 0)
					# 	door_lock_21 = plc_2.write_single_coil(3076, 0)
					# 	double_run_motor_ccw()
					# 	ex_lamp_22 = plc_2.write_single_coil(3101, 0)
				
					# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(2)) :
					# 	rak_lamp_off22 = plc_2.write_single_register(512, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(513, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(514, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(515, 0)
					# 	door_lock_22 = plc_2.write_single_coil(3077, 0)
					# 	plc3_run_motor_ccw()
					# 	ex_lamp_22 = plc_2.write_single_coil(3102, 0)
				
					# elif(list_dokumen['device_ke'] == int(3)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off3 = plc_3.write_single_register(512, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(513, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(514, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(515, 0)
					# 	door_lock_3 = plc_3.write_single_coil(3076, 0)
					# 	plc3_run_motor_ccw()
					# 	ex_lamp_3 = plc_3.write_single_coil(3091, 0)
                                    
					mysql.connection.commit()
				elif (list_dokumen['status_option'] == int(1)) and (list_dokumen['status_document'] == int(1)) :
					cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
					cursor.execute('UPDATE list_dokumen SET status_option =% s WHERE id_dokumen= %s', (0, list_dokumen['id_dokumen']))
					# if (list_dokumen['device_ke'] == int(1)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off1 = plc_1.write_single_register(512, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(513, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(514, 0)
					# 	rak_lamp_off1 = plc_1.write_single_register(515, 0)
					# 	door_lock_1 = plc_1.write_single_coil(3076, 0)
					# 	double_run_motor_ccw()
					# 	ex_lamp_1 = plc_1.write_single_coil(3091, 0)				
				
					# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off21 = plc_2.write_single_register(512, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(513, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(514, 0)
					# 	rak_lamp_off21 = plc_2.write_single_register(515, 0)
					# 	door_lock_21 = plc_2.write_single_coil(3076, 0)
					# 	double_run_motor_ccw()
					# 	ex_lamp_22 = plc_2.write_single_coil(3101, 0)
				
					# elif(list_dokumen['device_ke'] == int(2)) and (list_dokumen['rak_ke'] == int(2)) :
					# 	rak_lamp_off22 = plc_2.write_single_register(512, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(513, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(514, 0)
					# 	rak_lamp_off22 = plc_2.write_single_register(515, 0)
					# 	door_lock_22 = plc_2.write_single_coil(3077, 0)
					# 	plc3_run_motor_ccw()
					# 	ex_lamp_22 = plc_2.write_single_coil(3102, 0)
				
					# elif(list_dokumen['device_ke'] == int(3)) and (list_dokumen['rak_ke'] == int(1)) :
					# 	rak_lamp_off3 = plc_3.write_single_register(512, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(513, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(514, 0)
					# 	rak_lamp_off3 = plc_3.write_single_register(515, 0)
					# 	door_lock_3 = plc_3.write_single_coil(3076, 0)
					# 	plc3_run_motor_ccw()
					# 	ex_lamp_3 = plc_3.write_single_coil(3091, 0)
						
					mysql.connection.commit()
				if (list_dokumen['status_option'] == int(0)) and (list_dokumen['status_document'] == int(1)) :
					cursor.execute('UPDATE list_dokumen SET status_document =% s WHERE id_dokumen= %s', (0, list_dokumen['id_dokumen']))
					mysql.connection.commit()
				elif (list_dokumen['status_option'] == int(1)) and (list_dokumen['status_document'] == int(1)) :
					cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
					cursor.execute('UPDATE list_dokumen SET status_document =% s WHERE id_dokumen= %s', (0, list_dokumen['id_dokumen']))
					mysql.connection.commit()
				cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
				cursor.execute('INSERT INTO search_history SET username=% s, search_keyword =% s, information =%s', ( id_user , nama_dokumen, "Search"))
				mysql.connection.commit()
				return redirect(url_for('document_option'))
			except:
				session['nm_dokumen'] = request.form['nama_dokumen']
				session['msg_search'] = "*Dokumen yang Anda Cari Tidak Ada, Silahkan Tambahkan Data Terlebih Dahulu"
				
				return redirect(url_for('store'))
		return render_template("search.html", msg_search = msg_search)
	return redirect(url_for('login'))

#Fungsi untuk Menyimpan Data Dokumen
@app.route("/store", methods =['GET', 'POST'])
def store():

	msg_search = ''
	if 'loggedin' in session:
		msg_search = session.get('msg_search', None)
		
		if (msg_search == None):
			msg_search = ''
		session.pop('msg_search', None)
		if request.method == 'POST' and 'nama_dokumen' in request.form and 'device_ke' in request.form and 'rak_ke' in request.form and 'baris_ke' in request.form and 'kolom_ke' in request.form:
			session.pop('nm_dokumen', None)
			nama_dokumen = request.form['nama_dokumen']
			device_ke = request.form['device_ke']
			rak_ke = request.form['rak_ke']
			baris_ke = request.form['baris_ke']
			kolom_ke = request.form['kolom_ke']
			id_user = session['username']
			cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
			cursor.execute('SELECT PIN FROM accounts WHERE username = % s', (id_user, ))
			id = uuid.uuid1().hex
			cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
			cursor.execute('SELECT * FROM list_dokumen WHERE nama_dokumen = % s', (nama_dokumen, ))
			account = cursor.fetchone()
			if account:
				msg_search = 'Dokumen gagal disimpan, Nama Dokumen sudah ada, silahkan input dengan nama yang lain'
				msg_type = 0
				# print (msg_search)
				return render_template("store.html", msg_search = msg_search, msg_type=msg_type)
				
			elif not re.match(r'[A-Za-z0-9]+', nama_dokumen):
				msg_search = 'Nama dokumen hanya boleh terdiri dari huruf and angka !'
				msg_type = 0
				# print (msg_search)
				return render_template("store.html", msg_search = msg_search, msg_type=msg_type)
			else :
				x = cursor.execute('INSERT INTO list_dokumen (id_dokumen, nama_dokumen, device_ke, rak_ke, baris_ke, kolom_ke, status_option, status_document) VALUES (% s, % s, % s, % s, % s, % s, 1, 0)', (id[:9], nama_dokumen, device_ke, rak_ke, baris_ke, kolom_ke))
				a=cursor.execute('INSERT INTO search_history SET username=% s, search_keyword =% s, information =%s', ( id_user , nama_dokumen, "Add Document"))

				# print("--------------insert data----------------")
				# print(a)
				# cursor.execute('INSERT INTO store_history SET username=% s, store_keyword =% s', (id_user, nama_dokumen))
				mysql.connection.commit()
				
				if x:
					msg_search = 'Dokumen Berhasil ditambahkan !'
					msg_type = 1
					request.form = {}
     
					return render_template("store.html", msg_search = msg_search, msg_type=msg_type)
				else :
					msg_search = 'Penambahan data dokumen gagal'
					msg_type = 0
					return render_template("store.html", msg_search = msg_search, msg_type=msg_type)
		elif request.method == 'POST':
			msg_search = 'Data tidak boleh kosong  !'
			msg_type = 0
			return render_template("store.html", msg_search = msg_search, msg_type=msg_type)
		
		msg_type = 0
		return render_template("store.html", msg_search = msg_search, msg_type=msg_type)

@app.route("/read_dev1")
def read_dev1():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
        "SELECT id_transaksi, id_dokumen, status_dev1 FROM data_trans order by id_transaksi desc LIMIT 1")
    data1 = cursor.fetchone()

    cursor.execute(
        'SELECT device_ke, rak_ke, baris_ke, kolom_ke FROM list_dokumen WHERE id_dokumen = % s', (data1['id_dokumen'], ))
    data2 = cursor.fetchone()
    cursor.execute('SELECT status_pintu FROM door_locks WHERE device_ke = % s AND rak_ke = %s',
                   (data2['device_ke'], data2['rak_ke'], ))
    data3 = cursor.fetchone()

    data_kirim = "*" + str(data1['status_dev1']) + "," + str(data2['device_ke']) + "," + str(data2['rak_ke']) + "," + str(data2['baris_ke']) + "," + str(data2['kolom_ke']) + "," + str(data3['status_pintu']) + "#"

    return data_kirim


@app.route("/read_dev2")
def read_dev2():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
        "SELECT id_transaksi, id_dokumen, status_dev2 FROM data_trans order by id_transaksi desc LIMIT 1")
    data1 = cursor.fetchone()

    cursor.execute(
        'SELECT device_ke, rak_ke, baris_ke, kolom_ke FROM list_dokumen WHERE id_dokumen = % s', (data1['id_dokumen'], ))
    data2 = cursor.fetchone()
    cursor.execute('SELECT status_pintu FROM door_locks WHERE device_ke = % s AND rak_ke = %s',
                   (data2['device_ke'], data2['rak_ke'], ))
    data3 = cursor.fetchone()
    
    data_kirim = "*" + str(data1['status_dev2']) + "," + str(data2['device_ke']) + "," + str(data2['rak_ke']) + "," + str(data2['baris_ke']) + "," + str(data2['kolom_ke']) + "," + str(data3['status_pintu']) + "#"
    return data_kirim


@app.route("/read_dev3")
def read_dev3():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
        "SELECT id_transaksi, id_dokumen, status_dev3 FROM data_trans order by id_transaksi desc LIMIT 1")
    data1 = cursor.fetchone()

    cursor.execute(
        'SELECT device_ke, rak_ke, baris_ke, kolom_ke FROM list_dokumen WHERE id_dokumen = % s', (data1['id_dokumen'], ))
    data2 = cursor.fetchone()
    cursor.execute('SELECT status_pintu FROM door_locks WHERE device_ke = % s AND rak_ke = %s',
                   (data2['device_ke'], data2['rak_ke'], ))
    data3 = cursor.fetchone()
    
    data_kirim = "*" + str(data1['status_dev3']) + "," + str(data2['device_ke']) + "," + str(data2['rak_ke']) + "," + str(data2['baris_ke']) + "," + str(data2['kolom_ke']) + "," + str(data3['status_pintu']) + "#"
    return data_kirim


#Fungsi untuk Menampilkan seluruh data akun dalam bentuk list
@app.route("/list_acount")
def list_acount():
	if 'loggedin' in session and session.get('is_super_admin') == 1:
		return render_template("list_account.html")
	return redirect(url_for('login'))

@app.route("/history")
def history():
	if 'loggedin' in session:
		return render_template("history.html")
	return redirect(url_for('login'))

@app.route("/search_history")
def search_history():
	if 'loggedin' in session:
		return render_template("search_history.html")
	return redirect(url_for('login'))

@app.route("/store_history")
def store_history():
	if 'loggedin' in session:
		return render_template("store_history.html")	
	return redirect(url_for('login'))

@app.route("/account_history")
def account_history():
	if 'loggedin' in session:
		return render_template("account_history.html")
	return redirect(url_for('login'))

@app.route("/register_history")
def register_history():
	if 'loggedin' in session:
		return render_template("register_history.html")
	return redirect(url_for('login'))


#fungsi tambahan untuk menghitung jumlah data pada pencarian jika yang dipilih All
def get_total_records(table_name, username=None):
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    if username:
        cursor.execute(f"SELECT count(*) as allcount from {table_name} WHERE username = %s", (username,))
    else:
        cursor.execute(f"SELECT count(*) as allcount from {table_name}")
    rsallcount = cursor.fetchone()
    cursor.close()
    return rsallcount['allcount']

@app.route("/list_item")
def list_item():
    if 'loggedin' in session:
        return render_template("list_item.html")	
    return redirect(url_for('login'))

@app.route("/ajaxfile_listItem", methods=["POST", "GET"])
def ajaxfile_listItem():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            username = session.get('username')  # Ambil username dari session
            is_super_admin = session.get('is_super_admin')
            search_columns = ["nama_dokumen", "status_option", "device_ke", "rak_ke", "baris_ke", "kolom_ke"]
            response = get_data("list_dokumen", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            # print("test")
            return jsonify(response)
    except Exception as e:
        print(e)

@app.route("/ajaxfile", methods=["POST", "GET"])
def ajaxfile():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]

            search_columns = ["id_transaksi", "waktu_trans", "username", "id_dokumen"]
            # response = get_data("data_trans", search_columns, draw, row, rowperpage, search_value)
            is_super_admin = session.get('is_super_admin')
            search_columns = ["search_time", "username", "search_keyword"]
            response = get_data("search_history", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            return jsonify(response)
    except Exception as e:
        print(e)

@app.route("/ajaxfile_regHistory", methods=["POST", "GET"])
def ajaxfile_regHistory():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            is_super_admin = session.get('is_super_admin')
            search_columns = ["search_time", "username", "search_keyword"]
            username = session.get('username')
            response = get_data("search_history", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            return jsonify(response)
    except Exception as e:
        print(e)

@app.route("/ajaxfile_searchHistory", methods=["POST", "GET"])
def ajaxfile_searchHistory():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            username = session.get('username')  # Ambil username dari session
            is_super_admin = session.get('is_super_admin')
            search_columns = ["search_time", "username", "search_keyword", "information"]
            response = get_data("search_history", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            # print(response)
            return jsonify(response)
    except Exception as e:
        print(e)
        
        
@app.route("/ajaxfile_storeHistory", methods=["POST", "GET"])
def ajaxfile_storeHistory():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            username = session.get('username')  # Ambil username dari session
            search_columns = ["store_time", "username", "store_keyword"]
            is_super_admin = session.get('is_super_admin')
            search_columns = ["search_time", "username", "search_keyword"]
            response = get_data("search_history", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            return jsonify(response)
    except Exception as e:
        print(e)
        
        
@app.route("/ajaxfile_listAccount", methods=["POST", "GET"])
def ajaxfile_listAccount():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            username = session.get('username')  # Ambil username dari session
            is_super_admin = session.get('is_super_admin')
            search_columns = ["username", "email", "organisation"]
            response = get_data("accounts", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            return jsonify(response)
    except Exception as e:
        print(e)

@app.route("/ajaxfile_accountHistory", methods=["POST", "GET"])
def ajaxfile_accountHistory():
    try:
        if request.method == 'POST':
            draw = request.form['draw']
            row = int(request.form['start'])
            rowperpage = int(request.form['length'])
            search_value = request.form["search[value]"]
            username = session.get('username')  # Ambil username dari session
            is_super_admin = session.get('is_super_admin')
            search_columns = ["update_time", "username", "information"]
            response = get_data("update_history", search_columns, draw, row, rowperpage, search_value, username, is_super_admin)
            return jsonify(response)
    except Exception as e:
        print(e)


def get_data(table_name, search_columns, draw, start, length, search_value, username, is_super_admin):
    
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    like_string = "%" + search_value + "%"

    # Total number of records without filtering
    cursor.execute(f"SELECT count(*) as allcount from {table_name}")
    rsallcount = cursor.fetchone()
    total_records = rsallcount['allcount']

    # Total number of records with filtering
    where_clause = " OR ".join([f"{column} LIKE %s" for column in search_columns])
    cursor.execute(f"SELECT count(*) as allcount from {table_name} WHERE {where_clause}", [like_string] * len(search_columns))
    
    
    rsallcount = cursor.fetchone()
    total_record_with_filter = rsallcount['allcount']
    if length==-1:
        length=get_total_records(table_name)
    
        # Fetch records
    if is_super_admin == 1:
            # Jika is_super_admin, tampilkan semua data
        if search_value == '':
  
            # query = f"SELECT * FROM {table_name} WHERE {where_clause} ORDER BY {search_columns[0]} DESC, search_time DESC LIMIT %s, %s;"

            cursor.execute(f"SELECT * FROM {table_name} ORDER BY {search_columns[0]} ASC limit %s, %s;", (start, length))


        else:

            where_clause = " OR ".join([f"{column} LIKE %s" for column in search_columns])
            query = f"SELECT * FROM {table_name} WHERE {where_clause} ORDER BY {search_columns[0]} ASC limit %s, %s;"
            params = [like_string] * len(search_columns) + [start, length]
            cursor.execute(query, params)
    else:
            # Jika bukan super admin, filter berdasarkan username di sesi
        if search_value == '':

            # Total number of records without filtering
            cursor.execute(f"SELECT count(*) as allcount from {table_name} WHERE username = %s", (username,))
            rsallcount = cursor.fetchone()
            total_records2 = rsallcount['allcount']
            total_records=total_records2
            total_record_with_filter=total_records2


            
            cursor.execute(f"SELECT * FROM {table_name} WHERE username = %s ORDER BY {search_columns[0]} ASC  limit %s, %s;", (username, start, length))
        else:

            # Menghitung jumlah data dengan query COUNT
            count_query = f"SELECT COUNT(*) as allcount FROM {table_name} WHERE username = %s AND ({where_clause});"
            cursor.execute(count_query, [username] + [like_string] * len(search_columns))
            rsallcount = cursor.fetchone()
            total_records2 = rsallcount['allcount']
            total_records=total_records2
            total_record_with_filter=total_records2

            
            where_clause = " OR ".join([f"{column} LIKE %s" for column in search_columns])
            query = f"SELECT * FROM {table_name} WHERE username = %s AND ({where_clause}) ORDER BY {search_columns[0]} ASC  limit %s, %s;"
            
            params = [username] + [like_string] * len(search_columns) + [start, length]
            cursor.execute(query, params)
        
    
    data_list = cursor.fetchall()

    data = []
    row_number = start + 1  # Nomor urut dimulai dari start + 1
    
    for row in data_list:
        row['DT_RowId'] = row_number  # Menambahkan nomor urut ke dalam data

        data.append(row)
        row_number += 1  # Menambahkan nomor urut untuk catatan berikutnya
    

    response = {
        'draw': draw,
        'iTotalRecords': total_records,
        'iTotalDisplayRecords': total_record_with_filter,
        'aaData': data,
        
    }


    cursor.close()
    return response


if __name__ == "__main__":

	# app.run(host ="172.0.0.1", debug = True, port = int("5000"))
	app.run(host ="0.0.0.0", port = int("5000"))

