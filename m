Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190102;
	b=3davwSitLchn5JU5rxZNSmUe1X0ZIO6omYDKBGjO3uwn7Pnx9OllB85g/V2/yNWSKKrZ
	 gTszZTRQusu8/PWY394QdXyOXxK2jAH/EqHi5LM7PuOMda7B88u0OhrciRmwS5tKziXcu
	 zyfSn67sBb0oXAUOiYLoFCXoBiZhypkEuC4EFcCbYS6VKdWZjsVPzbJl4fi25gXPupDqt
	 iqYxx/okhNN54fDONBV5krICuAlSr7e1CrrNK0tp7MW4bK1lsrn/W2nUwrJY9/ujIq9zk
	 TT+X8FG4sDnYIK7absZpRH4oD8Nf2+ba7y1wAj+r+sNK1WIpG4IdWPnqAGfnRCWiWcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
	b=4Qr4m9rlWPUfMhASNIGqFOvP9nxwWL1k/eBUgwKV3brLktg7eVveJFPEquzOM1eTcIl6
	 1tOFyXQ3kVg8zKXkH43gBCf6Rzup5Lplw63KiFInc6NAqKkuTBQmxyNbc/xmBlewjjrmu
	 K0mB68MGuEv9nxS3zxm3Mv6jXBrxtGZjMq9rqQ5oWoFo58631KNO7/2Ng9gJuF9AYn0UX
	 3I//vrq4s+RVRNTgLmcI+C0vYZJpkKFfZataQGcNC1k3sHHrIW1e2/mPPQsDycdr4uBbZ
	 XL4vXFp6TTVglunhgknrg4J7SiiIWn54bAZ89J6cttAPg15QDKPV+A3NK49K7tP6CBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955460A382A
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 15:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0955460A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ou3nVCNG
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10655775e9.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190100; x=1795794900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=Ou3nVCNGovNAGTLI5Nwsug7qGSZlbrE3hryXPA5GJ7IjDhlmZA49AZ3mAguJfyvnGE
         pjwKv4VoLuClOdAK76Ne2G6bhvUBXCmjbFmcR5AuU2pn6clNQJZOgF3UpbAqTyjUNMlB
         0PMZLtl9PpGLlDm36Maj3BdsWrNtw/LDg02+xMKorgNhrJMZ7p6ul2xFpXHjzf4UaB46
         +SffsUD9OLtVLXzvmDOAzoTjiLmvxKJjJnlCJCOyVEqz4EfRCeaqx6T2mhAz07jkMKTm
         10oD/FKG2vB02TnSqqU6AkMc+pcZt++wgsvV0MARfIAxwAGBKccB7E3tjMgVQFDz/bPt
         F+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190100; x=1795794900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Woi1KVVkXXGab1Y1GMu8DNbprDgDmJk8VMTl2ZFXeN4=;
        b=SVhnhHGEddT+/DtElJlS1E9FGAdgT2c2E8cnDUhU1L/miZOUgO9cY75p/+sktDjgnn
         gIbA6ooOzvZuaUmtgksNKgwBRz1f6oRF22JE0vZtMJ9QM6lV0rkPt5WxeoRMbTouOuD5
         quuwLtpXPcOAD7vbp/SS2JVIHRC6NmoDtzohyM/VXLIY4Y2gryejiVfQI9yIVJLTLO28
         VtAGJ0qtck2bhmB0MrGi7EgpgkXwV/DvBqZNx5d+9IpWt/VzcHxqT7y3Flr8bDrfXOMt
         bbfSf8L+J/CsdH7KdAbQyeGfYDEgM1RruM1LpQc72MI26qHeM/tJDl7Xgjvw2DqS/1bk
         1zaA==
X-Forwarded-Encrypted: i=1; AL+hErE/wRhM1ctssCkNhM5mao8icyZCno4dKCwyj0I061oLYnBXYqRJ/vgBPMJ+TbcZIbj3N4+/Tulv3J0DkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8dyPrdVH/uMIsQPEtJW+EBKgvxXlWh1og1RuAcaKQlVmumZH8Q
	WcoMBb7/RWJ4sM/sCVtkkC6H/meztdw1eyRKxgiyMqOKtCPzs7dZ/ukv
X-Gm-Gg: AYBFou0NFRe3EiRKZq0raiaDcl/ASBO5mnLVdy3zcs879834fcuJjXOAmlAXwdPuYZU
	TdDWq1flNuJeKfjTTR/LcbEWuk5TdtE9PdbNkBdyj+FJIIAiPg5BtRiQNaWUiXSIIxLDV4Z/1IQ
	0+yJjaz4Hbgi4o38RDDO9FHeI3IWd35LOHqhJCSAAd3yKIxZEeAHADz5uerxmdVz3gIB2ePa0K3
	HY4TBeIl4uGB28TDojmNeMFlaQQ9hxsfemfgbOa2MuQpfE93qmbKboROxqn1uNhvIHAqrQjhjl4
	24MHWc1BHrMa+g+bAWCCgJEMn8+zvGrdPl6HGFLioyoOnYnaae1pNfzcUBNGC7gYRpsdFslsKmU
	B3XwSj65OHqe8PclRzy7ZsJpTFLavUzTMZt5XtBpjx+/xx8vuGGBhhz2nTzFVLQiwDaVkuspU//
	qNky37VwBM3bPGEQ25ovgG/m0VAuhPNO7uLRclmWXVVig8neXgyKKDxIIpZtJb9IWABxeh0wZ49
	yPYgCBC8gH9ZFn4pPGlJ8NHD/BY48/U3WYK4dDzwK7K/zoZC+YgNqfGZ5S5dNSVrmvVWVu2heXp
	SlAlc8yHvxWbp58pLK/Sc/mV3lh2l6MX7jy/73Oq1Lmv5VH3XwrNihZHHbr03o34ZgvKdKgYpQc
	=
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb88811c75mr88092485e9.19.1795190100244;
        Fri, 20 Nov 2026 07:55:00 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:59 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 16:54:47 +0100
Message-Id: <20261120155450.7719-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..6f00495d42467 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,28 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -580,6 +620,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

