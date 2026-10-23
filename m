Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792758842;
	b=kcuiDCzMp5LhEuVNgWNNRWafOE85OijFt1iy0IZ0OJ6Dw1lgJW5q92PAZp3r05/mxTi7
	 PQLViUPh5/5J4t/L6oNXmgzzid0fNhAg0nQ0StDTSF+tC65t4zpWdq1q/izVN17zQm7cY
	 Rfa/DBJavCJ8c0r/3KJUOuQtgG7PBfLyP8qpmMGH/RMCKdEVCUzc+FtBBSTGbh7eBcfyw
	 grdNow7uMGj/A4cKQZFeC+2R/hp88Ycn7h4tIaChO+BZvmQRWI5YmTfNRAUpy160A3dU4
	 NYO/14szGm6+9B5BNaBdiecNfAEKQlC4p8PwIMO4yMC8diEyijGufqSGqEGcE3E1NTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
	b=A9zMsPMQJNTAxyOya2GuxgbfzJELriNtnyi10DX09zCWVXgXamFu0zCZvSQhSS5hFqiR
	 zP42iV8XodpvsfmJ4SKwBMpi3XmRqG/+DQCCCCcl4RvYJ6kw4+WQVtNq1SfpB2Vre6OhJ
	 TaPnfM0ejm1ONrhGE0MR+TQ0ii/V7NTxYWuj82xm79kgag6oyqFSgN1/p2Z1nsEpP+F1E
	 uIaB1VQaLVBPSvdKT0dKkdI8ef/Wf6JlqREOKPQAbPgyMZKMGXnRkTMPzflkh/e6GX0oA
	 +WjeYTmTxTZVEL6QaH9asrBuAAuozyYz+cOyQdRq1AWLAPhuhoD/GnOeX7XX/diP7Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DEA606A31B
	for <phone-devel@vger.kernel.org>; Fri, 23 Oct 2026 12:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DEA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=pMlORL2I
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso527123f8f.0
        for <phone-devel@vger.kernel.org>; Fri, 23 Oct 2026 05:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792758839; x=1793363639; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=pMlORL2I6+7rhNHqB8En4FG5uhwxzwQF47m2miuC9rrV66FJsPYjqlo7yAdff8y5Rb
         UrvXjKaBs1IuPVfTNGy7PB3il8E5izR3RNho35cXnFxIAM6ZASelIgsLfg0zIU8GanDS
         QOgY6HDQR8mokySp6e9XnUwVOmSlihQNYA5In1E7/vYyOUX1gTaP2e+7CJfmEzHqtpXS
         4hegguegEOf7uVQQHTufUG5dvGf9isXtLLZPooCltDkrlToJxoRwG4vekDuPdDz4GcDe
         0uOYWV+zoJPTkJLEhSM89XwyIKrob6A0opj+zhUd/dAY0B2Sut1taPxfkyLl2GRZSDxF
         mIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758839; x=1793363639;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0rnI9vadXsYD8rBdMbbzshOtJjoEuCkdwfFl2dhThMg=;
        b=BpYk6+iX3aOdbRVPxIl0uG/MAxm4eBinblX4DtMnPzVEJYTbm4P6kbZrrcZ8RgJiwE
         frz6Oszwj2koCNhqNHU9O8jcgjWRZsSV5xI5a79mCAO5gY57V9YTDvTqjzTW0A6oqXgc
         GZu4xdw2xLrWjjnYUzk8GAjyhpcn8QPZBFFXTFwze3prK0G/P+lbBZYZ5MI39hLuZa8m
         xBgCaxNVgEY5Svo+Kx7eR8tXP71O9yMCNzPLXsMo2DUkTImEaWpywiVMhKCWgfd/of7q
         h0NIcm5PxdQpj0x5eaASDJpl/fSTZoMXQJoyLPZwupLxVYxy+ivveu9Aa2LPgPk8IKTR
         nlUw==
X-Forwarded-Encrypted: i=1; AKwUvBxI4dGKd23OIUrYVetSln85DD1+Ax6Cy2InPR4wbEfblscJTfa7kcp/OdgZVjFTl2pTZx7GiB1CZhJilg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIY0s82sTlP4dbxDonWd9g6LiZusFi0A5EMFuTbFsgBbq6aIUaz
	Mi3SwV/3hevULPYNW219qYefzX/5nIZfKCfn9RDDGz/3IueP7F97vuubQqwOQ/etgZQ=
X-Gm-Gg: AYBFou0ObhzQj/7KAL4UXa0w6j5A0PLaQV5sgdyKj8im2lBV7fMNDPfgjTMKSZANb4g
	UTr5hT6t2TpWfyyqWNb0WMSN3WUkUzJ4Lu0xSvWZ3BhJtClISFugfDFBJ+LLp5LQIBl4QfyCh1d
	zRzQLIvpMq4PEKNR+F0ib8+ml2fC7CKTvxt0E3B9/nU7O/NUQ8VwylQMM6CQyN4XHmxfo7AsJja
	JIMk0R6Xj95oBpKstI/KsWoY6c1vHa8FJaFViOlhafFhHjM6TXWPU1HtoTOIkjovyxNyrp/4Dtx
	XytTnV2YGKyUCD0vjjZf90ZnbUVEILiF9p34chJy3IavK8BThVbiNSJy+OP24JPLBBPGyVLdvkg
	e3EvPQouMZsW1FAyKzoFO+25g+wNjTVdvEqEWEiELcu7v8YggbKu5G1l7sGc/aA2EP4/qnUiaXv
	7HQHShPs02jUjrlTtEYT8P1/muvwvLaSzhgHnwUZ46gLJXNJkqBEgjC4tv7COMPx06udnRDc3rH
	TF6PtXHDC1eOQ7TBajxrpzueWiUOz2CACyUGnAGJ/CmB47Wary6tHFLOQmp/SXLuKU=
X-Received: by 2002:a05:6000:4288:b0:48d:cda6:4dd7 with SMTP id ffacd0b85a97d-48e385b4621mr3251773f8f.44.1792758839526;
        Fri, 23 Oct 2026 05:33:59 -0700 (PDT)
Received: from [10.221.242.139] ([93.123.20.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e37edd26dsm5554766f8f.2.2026.10.23.05.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 05:33:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 23 Oct 2026 18:01:55 +0530
Subject: [PATCH RFC] phy: qcom: snps-femto-v2: clear charger-detection
 state on entry to host mode
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-phy-qcom-snps-femto-v2-host-v1-1-77cf6a5177cd@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTvQjhLUreAB3IqLmE7NCE1iJ
 hal9O5GXf6/eDMoZ2GFfTND5klUYqjRrRpw3oYbo/S1gVoyXUtrTP6NDxdH1JAUBx5LxInQRy2
 4cz1treGNMRaqkDIP8vrpZzgdD3D5T31e7+zK14Vl+QAvmyLfhAAAAA==
X-Change-ID: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792758833; l=4680;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=c//aO+uFRscbScqkNAvaaqbbKqzdZoy9nP9LH9BBuUw=;
 b=277h+fYW2NZCq8zkRo74BKyfkAOx+NVESfzGX0KBZvoRuS2vkofYvCJnTaYvxZi3/dHOkgswY
 Y04w1TMcjHWAe7UVqbc4p+2OsP/gemCutXE9HhiaPolYK099c3tFaUw
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

On QCM6490 (Fairphone 5), the firmware runs BC1.2 charger detection over
pmic_glink when the phone sinks power from a USB-C dock. It leaves the HS
PHY in UTMI non-driving mode with the datapath override enabled:

  UTMI_CTRL0 (0x3c)    OPMODE = NONDRIVING                 01 -> 09
  CFG0 (0x94)          UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN  00 -> 01
  HS_PHY_CTRL2 (0x64)  USB2_SUSPEND_N_SEL                  06 -> 0e

Linux never writes these fields. They match the configuration the
downstream kernel uses for charger detection (its "dpdm" regulator); the
downstream kernel re-initialises the PHY afterwards. Any femto re-init
clears the state, but on mainline nothing re-inits the PHY after
detection. When the dock then swaps the phone to host role, the
controller cannot drive the bus. The HS chirp fails, the hub enumerates at
full speed, and SET_ADDRESS times out (-62). The state persists into
later sessions until the PHY is re-initialised.

Clear OPMODE and the datapath override when the PHY is set to a host
mode. usb_add_hcd() sets the root hub PHYs to PHY_MODE_USB_HOST_SS before
it starts the host controller, so the clear lands before any port
activity, on every entry to host mode. The clear is idempotent: when dwc3
sets PHY_MODE_USB_HOST again after host init, it finds the fields clean
and writes nothing. On platforms where nothing outside this driver
touches these fields, the function only reads them.

USB2_SUSPEND_N_SEL is left alone: HS works with it set, and clearing it
has not been tested.

Tested on Fairphone 5 (7.0.8-sc7280) with an i-tec USB-C dock: the
unpatched kernel failed every sink attach (15/15) and the control arm of
an A/B on the same image failed 2/2; the patched kernel enumerated HS on
every latched attach (3/3, with DP and charging working), and has been
in daily use since.

[This change was developed by "D.R.racer" (with the help of an LLM), who
 doesn't want to have their legal name referenced. But they agreed on me
 taking the change.]

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm mostly sending this to get a feel for whether this would make sense
in the eyes of the maintainers. This does fix an annoying long-standing
issue with USB stopping to work, so I'm hoping to find a way forward to
fix this properly.
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..e2b9404aac4f 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -226,12 +226,48 @@ static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
 	return qcom_snps_hsphy_resume(hsphy);
 }
 
+/*
+ * Charger detection run by firmware (BC1.2 on QCM6490 with pmic_glink) puts the
+ * PHY into UTMI non-driving mode with the datapath override enabled and can
+ * leave it there. The controller then cannot drive the bus, so the HS chirp
+ * fails. Only a PHY re-init clears this, and nothing re-inits the PHY after
+ * detection. Clear the state; this is a no-op unless something outside this
+ * driver set it.
+ */
+static void qcom_snps_hsphy_clear_chg_det(struct qcom_snps_hsphy *hsphy)
+{
+	u32 ctrl0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_UTMI_CTRL0);
+	u32 cfg0 = readl_relaxed(hsphy->base + USB2_PHY_USB_PHY_CFG0);
+
+	if (!(ctrl0 & OPMODE_MASK) && !(cfg0 & UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN))
+		return;
+
+	dev_dbg(&hsphy->phy->dev,
+		"clearing charger-detection state (ctrl0 %#x cfg0 %#x)\n",
+		ctrl0, cfg0);
+
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
+				   OPMODE_MASK, OPMODE_NORMAL);
+	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
+				   UTMI_PHY_DATAPATH_CTRL_OVERRIDE_EN, 0);
+}
+
 static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
 				    int submode)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 
 	hsphy->mode = mode;
+
+	/*
+	 * Reached from usb_add_hcd() before the host controller starts.
+	 * phy_initialized only changes in .init/.exit, which phy-core runs
+	 * under phy->mutex, like this callback.
+	 */
+	if (hsphy->phy_initialized &&
+	    (mode == PHY_MODE_USB_HOST || mode == PHY_MODE_USB_HOST_SS))
+		qcom_snps_hsphy_clear_chg_det(hsphy);
+
 	return 0;
 }
 

---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261023-phy-qcom-snps-femto-v2-host-9cd28a6e466a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

