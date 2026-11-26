Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719608;
	b=L77xLabvbNayCiqJcAtA9wG6PlURIph+xYC/NScNMcvInrSmS/tmIJE73E+vA1WJyvlU
	 2qlROSsv6V0rwDV2i7doaQKIAS4Ety95MrvFHRcN3FQgfain1DPn49tF8ciPzLlVTKZ7b
	 BslclGLKv29dPNaS9nqBAPuxwS60S9tGtnSv+dTm3CocEukpUnKIG9ryW419wjnnonSoj
	 ucJR62Ne0b3rDMJDmoJ5d8qTCZTgl3KHSlt+s+2uCY6oeZK2lp7PwvBlB3mrpHm2NiCul
	 atugxryzVULpUs9rqBK+ipZRhew/8AFbbd58hMOc2Z1VOZ2IA0qotPL157dZ2PFD3tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719608;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Date:
	 Subject:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=M/MaulyTDWRlXEo0XH/+KmygHsZopRd+M68viLANIDA=;
	b=z8rS12M7vKl+UupsHa7Tp2y9akKMuReyc2E3kJjGZOITjCU89q+mPcfCS39eSWsfWhst
	 rNuyBBa7rxxcHzzSWgp5eNo/BAvs+mOzpMIzQ1vdhZFV1SAN/wfkBKEJr3Qy7p+fSr6FF
	 5qbnL54u2TaEVuzxIU/JX0pJzkacI61MT3yU7YWX7ATCX6MGSebMyKmvEGioO7gnJ5qZf
	 jZts7u3dilNoQac3WQi3UtwuU3LRfie+RWdj+NEWDhqJhzA9y0rVrgbQB9Skb8WqOItXl
	 IScxj496+w+PnL7Ay3sjEG/XqGLsDI/2BpFkbSLcvmeBMw6pkxcsDDEbONTTf1Wg1Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=michaelmcallister.org;
	spf=pass smtp.mailfrom=michaelmcallister.org;
	dkim=pass header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5QpuZVt3;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8DF606A335;
	Thu, 26 Nov 2026 19:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B8DF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=michaelmcallister.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=michaelmcallister.org header.i=@michaelmcallister.org header.a=rsa-sha256 header.s=protonmail2 header.b=5QpuZVt3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=michaelmcallister.org; s=protonmail2; t=1795719605; x=1795978805;
	bh=M/MaulyTDWRlXEo0XH/+KmygHsZopRd+M68viLANIDA=;
	h=From:To:Cc:Date:Subject:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=5QpuZVt36MgzmRHb00LLPzSfqjtq+rHY5GVdD6c7netajtqUTiUenHL/oSZmPL6lP
	 cTLIzWFSHc3o+wikUbFup2B4HmJ2q/ToagS4M0QWw4AfROKgkZWlLH+AuBdzwHU7pK
	 Om73Bud6G6v3Sw3HFW7gNLJa3HiMfuV53ZBROH4aXpRm5H4WFhC6ZTmLpPoeuKflzD
	 iJf+KzgDdM7cZPoh5Z0MsUVxZL4aPTBNSYosBVRYLyvJFG3XmXfwMWTe0B9dej1xzS
	 //iOO1KadtEbyi2osiXLKQZcJ2T5FUWh1hIv81WKXpHBkH0DGOhp9v8vfOpuqB3ka0
	 ruRLPJHuvdkWA==
X-Pm-Submission-Id: 4jb5TF0S3bz2ScX2
From: Michael McAllister <me@michaelmcallister.org>
To: marcel@holtmann.org, luiz.dentz@gmail.com
Cc: brgl@kernel.org, enderaoelyther@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 lumag@kernel.org, markus.probst@posteo.de, mka@chromium.org,
 phone-devel@vger.kernel.org, quic_bgodavar@quicinc.com,
 shuai.zhang@oss.qualcomm.com, zhaojinming@uniontech.com,
 me@michaelmcallister.org
Date: Thu, 26 Nov 2026 18:59:41 +0000
Subject:
 [PATCH v4 2/4] Bluetooth: qca: Power off after unregistering the HCI device
Message-ID: <179571958167.81221.16925052773581892055.wcn3950-poweroff-v4-2@michaelmcallister.org>
In-Reply-To: <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
References: <179484638195.54009.1916641645532262287.wcn3950-poweroff-v3-0@michaelmcallister.org>
 <hvwqozj3r7n7igxw5qogu7xxya4fkhqanb334sroj37ufzdizu@qarvtlkkulmj> <179571958163.81221.3368253997777320112.wcn3950-poweroff-v4-0@michaelmcallister.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

qca_serdev_remove() powers off while HCI setup and UART writes can still
be running. Leave power-off to qca_close(), after HCI unregistration and
write-work cancellation, while the serial transport is still available.

Check the actual port state before sending the power-off pulse, since
PROTO_READY is already clear during protocol cleanup. Start serdev
controllers in QCA_BT_OFF so registration failure does not send a pulse
before HCI allocation or power-on.

Signed-off-by: Michael McAllister <me@michaelmcallister.org>
---
 drivers/bluetooth/hci_qca.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 0f893f16a..53239b0ab 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -616,6 +616,7 @@ static int qca_open(struct hci_uart *hu)
 	hu->priv = qca;
 
 	if (hu->serdev) {
+		set_bit(QCA_BT_OFF, &qca->flags);
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 
 		switch (qcadev->btsoc_type) {
@@ -2286,11 +2287,7 @@ static void qca_power_off(struct hci_uart *hu)
 	case QCA_WCN3990:
 	case QCA_WCN3991:
 	case QCA_WCN3998:
-		/* Both of these write to the serial port which may have
-		 * already been closed by hci_uart_close(), which closes
-		 * the port if HCI_QUIRK_NON_PERSISTENT_SETUP is set.
-		 */
-		if (test_bit(HCI_UART_PROTO_READY, &hu->flags)) {
+		if (hu->serdev_open) {
 			host_set_baudrate(hu, 2400);
 			qca_send_power_pulse(hu, false);
 		}
@@ -2664,22 +2661,6 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
 
-	switch (qcadev->btsoc_type) {
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_QCA2066:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		if (qcadev->vregs_on)
-			qca_power_off(&qcadev->serdev_hu);
-		break;
-	default:
-		break;
-	}
-
 	hci_uart_unregister_device(&qcadev->serdev_hu);
 }
 
-- 
2.39.5

