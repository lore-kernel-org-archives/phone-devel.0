Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A93D5253
	for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716605; cv=none; b=kIyhl8rMfNqcL8q01251SLfYyhx0tRHp8OOE4qd6yAYdEvMiQ5jOlrOCS89DTbYWHm4g/FhBtT7WHSoTGPGmgGJ1kQ0nr0cqHn+OhxQaco1ThXDFwrIOFLiNE29+8VbGjEgYctY8MqN6FraC4NLXUGidsdJ05v6dXn42ydi0dFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716605; c=relaxed/simple;
	bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqFZqwYAOfiTwwX7B1oszf4qcyFCE2aJ9NM3yHRm6sHdkXuu/Vz7DjMokIBwDCKaS+aRkLLZPZ9HCNx7MSexH8q3BJ3mVT8n/DkfCTZltVEasDmfwpVbSfofCLK3JWP1rQMe279tn+UDYtLJlAOZgnb9IvZ8lAdOpqwsqQYZa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p7w9+/kk; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p7w9+/kk"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso535981a12.1
        for <phone-devel@vger.kernel.org>; Fri, 18 Sep 2026 00:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789716598; x=1790321398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=p7w9+/kkhj5DvJ/KbvXEHJ+2s7Zm49sC4kRnUrDGS/7HDkoHK8RLEeIYIT4kMasctp
         VKXtB7vgwdWoDiwZn0TwMKFvsMujtsKW4IZmwgNUPsa0uqa5PZPiG+tU7mZvDoiERGWS
         ogxviEKXNdCdl9SzjKkNSI8nPc+DkJBEHhsDYWYropnTwITbtO3CH/S3QhmDgTxSGqkJ
         4+02P7zfWOKHFyskO2NTlMdn50EwWqI2DL4vSY5kUSQMCQs/7aM+D+HDeRmEjEi5J6/T
         JR6U5lvv+yiJZFzd3dYWeNge6MCVzBem8kHyLY35w+alRmR6VaCDWfn2paKVA+MpfcAF
         Nk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716598; x=1790321398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=V9vMcXQ2SmE8jk6spJumoH1Oh7v0Hp7rF4t6C4rciSNtQYorU2VpP7GRWCD9o1fSx+
         TxpIIct42G5MmlhIrI711VfcEQt6xdKMKTyLL5ehIhOPO9ixlMJlYG6oaWFu5tMOdugg
         Ww/RG8Yb3RYx7RlugJIoIcSi9EJlR9lswYQeHsaD/21P6wPB0lgMJ3+ZvsMDZgC9mnJ+
         w+6E8XsdiDFYVsDe17qCcch0SrPt/WNNlMa2lscVgtOJMZkaP2CULI2PsvZFdBrcpu1c
         st3MDF5qLp+3I+kWSFDqycTCPFHvazKWftr6mGJY2kuTTRc2UajKnhNK7YDwzzdKl8H+
         jWFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUfahU2OTDh46+w3ilmpJY6R1C6gXfjTN3/dG2FcOKfcizAYcJtq5yGwvxWxuOT5hcXC1vFbGfEWu3jw==@vger.kernel.org
X-Gm-Message-State: AFuF++kZnM4SeDbYYZWCm3iwOqjHvtA8IGfkbAm8gEklME5UwenOwlz/
	zDHFnrvQ4FuhZAdJEeTlTTHrJOF0W3F73dK4UGfUXxtuJJqCVVhjz+f7a8M+CjHQUtI=
X-Gm-Gg: AYBFou09JYNnQqdIJ6aCEZlHUQR8lW4jct8qOyPTPz+kMeNU0mefKSk6noOTuPkg55i
	vgAj2dvAP4HnG0Ue/DDuNlPcgZ/Wo35ONbb+dYDvGncNQSPt/fFa4oZVBRfnyj8TKBeIQ8Efu0Z
	aZxSM/tJIxipQAlch2oev03rbZl16lokvgG/b5SuRl3dnca89dLE+PSHTwChoHxPMK5bzQ7eeIt
	Ny8ZkF8lZCxIDjsAiJns/MfsuSNGjKJxZhEK4MJ7l4sZeV0qyFTzB2mFLCxMOB3Pz+yLRaDZ+Rd
	+uAf3GuqwzsFyODSP3B4l//2c7Fq9cTKl9mUPTiAmTqVs4ljqOmh5rnVYe3rasrSw8xg0LDc9Pf
	fLo/jsyjxL0VR8L0UNPqQXuph1ZOEUpEXNf4W3AnmmqhVz/f42QZuPjaE1ugqp9WZIFBMgIMCqK
	Pd6Oo1O1SGyQnk3ikSRAPLb6HkyuEkvJtDp9T2+fwMOQHwBdBwf6v7b9Rd00hIhDrks0rqom2oH
	aSE03GFVhAIkTpN0/dwiO2NYoRt5BI+TJHStLj2S3W/zRXLOM7SVfj9E+6DeqI=
X-Received: by 2002:a05:6402:4406:b0:6a7:f505:ef3a with SMTP id 4fb4d7f45d1cf-6aa548a74c0mr564874a12.35.1789716598550;
        Fri, 18 Sep 2026 00:29:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58d55cd3sm462048a12.2.2026.09.18.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:29:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 09:29:54 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
In-Reply-To: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789716594; l=1602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
 b=FSUkC8Dg+KYzQ1EbVyPSln4RuJEUYkt0GCi4zrHCKl6m1CNeYmsTytFydVGIhLVu7WZEc283N
 JHQdxsdjJ/SALm7EsjPehZ2veC95aM6/MbRmVii4aLXrmNkQCsjglDK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0

