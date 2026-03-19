Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEF33E5ECA
	for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 15:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773934601; cv=none; b=kyZ3N4V0JIxA9SyI+g/CBKxOBsg3ifLIrifHAwwR/rcmwrE3+5e/OD9tmgBX8ktPoTpHdYbld2CTojytf6GEFcb//NTMGL5rQt8Klf8Zicb9USiown2Q7IhQZAFMEoK1xMI9cnLf59n+F+ZHxl+Kc2pf7NptxT5QUNKkiniU+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773934601; c=relaxed/simple;
	bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HdFCueDpsl1z8D0kZfL5YUUyLPJD7wQ4O052hwErHXnjredgxj0Gqrpjz/3eIPAeLROYIVMpGFR6Dpr3gjtlY5HvreZRkp62iQPf7rm0n9D/LOh/Xa8RhMcrtnGfF7reiH5w47qPf5yFRq3gvlewOc0P4wLmdGQVRuYUmHvF6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=l3S5Wgnc; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="l3S5Wgnc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so1349203a12.0
        for <phone-devel@vger.kernel.org>; Thu, 19 Mar 2026 08:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773934597; x=1774539397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=l3S5WgnccwfxLQIfqKAtJQ1GIybpxRBXsZ7ss/XOqkb23tdhZTD45fk7ZJivZMvvTo
         Kcv53rZaBIovZH8MniGOR2dOAnVEA/Gxc7gwqA25wnPW45qUgKbu7my7iT3ZOnSoS2Gc
         TiXOMMKDk3Y/kCEH8+PgXL3km8YBDD2x/SaTFmGC+pMwoNKGolICcCQ/u3O8Y5FWC1OP
         5dbWDT7koY7pfU4jM6Ns3AsN+tarFbOJn869trjr5YnfzpquM/xeHvA5YA2X6gqprTKd
         t6gmOKIs7zavyhjiOco+0Kyj8lOW+8bABIe82hUGr4AofClLe5QIHm2t1KBM3150vd7C
         FNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773934597; x=1774539397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iN6KKsEF4bWiFrFM9ysSK8lwY6F3e56lREb03czgqC8=;
        b=FHC4Quy9a/De+FMuG+6A7gsEY5mGUpZlZvQ22OpXVeOS9Q77jRahAYYEED7s2+dmxo
         J2oaDemWvQQYtAZY6IpoMmmLpvqupSi3KJSujhojElLoe97PN/PWGoz5T2oLHlLPANNQ
         EMxHh5dDs44BQwbPu3l1VejWxgAyInP0T5C/GWgZXOf2EpjMXEnCG1lBRBY+ANIV2EBb
         UKckr5DvIX5p5A+MPs9UE6hpclmgZTWGjJWiFqY4tA7Kke0M/PtNzscX8XteOFA+FRnF
         mvEs6QXLiyhb3Q8N5EbUzGuarIrJbxbENVhifS0juXkS7YmF8vR+QKybEsl1Ja5MWSG6
         KTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1VNV26NPgOf4O5+e0NGYPIaygsRjeLceyTcrkW8yosdYcd3MegvquPUha8hf6r3DT0RWD980AyoYiHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgKeDgsgU4cOitahbElOkqbgtDlcSzubuAQymco9lB8qZCjVh7
	ETj8SXwabO1RQWmLNH4Vsq3JKAHlpipk6vYstXp5bsAfX305Fvc5xWSZlyXyVpmFQgI=
X-Gm-Gg: ATEYQzzAHJwN2akgRYxcAf/FfhLA4bfXjob6i9Ms+1ef1yA7YClzQE6hKp5reCBxun+
	KsJWV1bqdYbWJPNwz2pJT3qpONg/Deios/fdzBPVm1zSgb1bDZGQWcEyO/WRLBOdY/PDGyojU4n
	4u1h27SbQxuTsA7xolmgT6e1dt/s0Z0VP3o/zwRB6p6ZUaB6Z9wzirmB0VnND/8l6QXbtaMqYnO
	2YtB/NO/01JZ9Tgklk6wZASnne4zyx5C9C8IexCUW3ZJ/18GID9df6s02riwHVNIVNzfAZ9N9cU
	QCBdb55q9BzBfHqbZPdBBEx0NNLOP9nU02jvw7i2DO9gzdrZt+3ZF9oZ9wYiOpewwJgkdzbSiHH
	QaEHuq04GMnRDjrYC2n7MNcV8GRPJtHyoERPF3WJHx6ny5xOeByoFQku3ISRCQ5tQC9bYCR6lBF
	tOFDi9xYgwSSa2ltGHlMoPgWfXKUZ8Me0Wu1qikqRJIrd4616/2Bk7oO2UDmJNdnQep7A07B1yw
	JXQuw==
X-Received: by 2002:a17:907:2684:b0:b97:344:7d3b with SMTP id a640c23a62f3a-b97f4a60298mr445096866b.31.1773934597374;
        Thu, 19 Mar 2026 08:36:37 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f173a3ccsm457568366b.59.2026.03.19.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 08:36:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 19 Mar 2026 16:36:28 +0100
Subject: [PATCH v3 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Sort
 pinctrl nodes by pins
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-fp5-s5kjn1-v3-1-9cf4b8c09567@fairphone.com>
References: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
In-Reply-To: <20260319-fp5-s5kjn1-v3-0-9cf4b8c09567@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773934595; l=2875;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8w/E078ryHouVBIkDM5VDxMyqIuPpnQJBxohdYMpZzM=;
 b=ryPESMsX54s5tOZtqFBy/A6pH2sDHEEgK8lztbunWwwW6BOjVWeRO+MkdRKDeaeCGh443M3Xp
 BU7MpT0qhcLBvvJH2ghJ7SZCvh0vbqeXgJE6xSaQjEBTC5JSYjUrO3t
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per DTS Coding Style, sort pinctrl subnodes by the "pins" property,
in preparation to add more pinctrl states.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 74 +++++++++++-----------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 455e5c9bb072..c9c24c36ba7e 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1257,41 +1257,6 @@ &tlmm {
 	 */
 	gpio-reserved-ranges = <32 2>, <56 4>;
 
-	bluetooth_enable_default: bluetooth-enable-default-state {
-		pins = "gpio85";
-		function = "gpio";
-		output-low;
-		bias-disable;
-	};
-
-	disp_reset_n_active: disp-reset-n-active-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-disable;
-	};
-
-	disp_reset_n_suspend: disp-reset-n-suspend-state {
-		pins = "gpio44";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
-	hall_sensor_default: hall-sensor-default-state {
-		pins = "gpio155";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	mdp_vsync: mdp-vsync-state {
-		pins = "gpio80";
-		function = "mdp_vsync";
-		drive-strength = <2>;
-		bias-pull-down;
-	};
-
 	pm8008_int_default: pm8008-int-default-state {
 		pins = "gpio25";
 		function = "gpio";
@@ -1345,9 +1310,17 @@ qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
 		bias-pull-up;
 	};
 
-	sw_ctrl_default: sw-ctrl-default-state {
-		pins = "gpio86";
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio44";
 		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
 		bias-pull-down;
 	};
 
@@ -1359,12 +1332,39 @@ usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
 		output-high;
 	};
 
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio80";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio86";
+		function = "gpio";
+		bias-pull-down;
+	};
+
 	aw86927_int_default: aw86927-int-default-state {
 		pins = "gpio101";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	hall_sensor_default: hall-sensor-default-state {
+		pins = "gpio155";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart5 {

-- 
2.53.0

