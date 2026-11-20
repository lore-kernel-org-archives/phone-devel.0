Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160052;
	b=0n3h+AlogKW3RBXAp5PXrQKrDNE7UmX+IoRaeJ/vb7oDvVOfeELNjl/T9UlanTlNR1pv
	 GKTxGuU4xfVVH6CJqbiUVo9h/q3rjY8hYgaiyhfEl7JZsWa7mrb6KTNZNVmx9eUy7ujxY
	 OOsA+lxIm0GvRj7iCre0U/2Lu7PpH5X9kX2Cdm1Q0erw3nrzWBkuTE9V9oL4tluVyBGN0
	 mT6vQzFcvX/nWazI0OKhj+cub2qQIb6332ADDTqEXBbaiz8Ovj6MNAP+zd0zDyEiUTCj7
	 n8+IIyLaQXN0ZgRfpQ5B/knMEOm8zCWD2cVZHBLZ+ZJ6S+Qnh9Uvt3ExlayB+qgDO9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
	b=K2v62kmaaWjDEDM84u8IITI4UMMwG4CAahXeWkW8Tip3ZqqszLkGYVg0rLepmheu3kVY
	 8Ank2UQX6Wt4mhoo0jBr9jwXOM+DyM0r1u47U57tboagpRMvcDwuDOKK1ts9uzBujIu30
	 2DBF+8SySecTm13dBWssOco6xTyb+Z3coVIsZrlGuYQJ0W1cfvvWTRWPOptdO+gKO+d1V
	 VHWxZzsHInmke51D/KbRfhmVu1IxonxM4T9KhckAlG7df5n0OTtxZFsJAGLp4OkIuMJaj
	 VoMyIO0adpoegtp/HaXoC3QoxAz6aCrUJW/6vvHsl/dRhverSHLFbWy82Oi/++E8SCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049360A380F
	for <phone-devel@vger.kernel.org>; Fri, 20 Nov 2026 07:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D049360A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HKPNdU8p
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4317805e9.2
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 23:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160050; x=1795764850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=HKPNdU8p6BYIA0PhbhaC1eJory9J9d32I7tNCfsWv3fuI/ikf80iOswt2MD/UneDAR
         pZfsOIkqqGcjGwnK+QtkPXz76nrHkKEKIwP45S6dvMaiaSmTWRYOYMj9bs8Kvr9CqIhy
         UlpiewL52fQp4co1XHQk4F373mEW+dWSbBgzggPwt42FJHWZ7PAAtv//hGT/1c5aa2xJ
         /zbRclE/JIs2XkUT1vW3xRAdh6aefo8FO+wSmudGTq3AiCh0FSnZyAGRaqLKNoh5deiz
         cM5lGO7zQLxFPFWg9KsIf1xmHAtyWTRD7J4o+skfJ5KIHrZLemE6Y9/SB3dgKLtZsULk
         xLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160050; x=1795764850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRnaLXMIjjDmMSY6mFAZa1ZXluewGJuLAGDDGmmf4rQ=;
        b=AQ2EbZ+zQm0zrIYyRCB9e48NCOUX7uDoYKiNasydtDKOWZAQcYFrQdlb9z9fwDatb5
         SLoImvHB89zgtnw3rQ/pNJIneFyj+eH96s1joNj8hIEkDmzGOdtvrGA5pDEMmyH84Vvn
         fUOgEtrhhWO7Es0MpYrD5Z5lAJe1N1wwTlTXKhnDRBNHrvxINmFMyFgKm1Gjd9UU4+k2
         xhqZk3u9hfZlYCtbrD0gPKTE51MyPpTSxL6+MxelbB9VZldz8ocwWgnv5O9izKvPThgp
         S78tsIiZHdh68xBke0NKy+QqRJb4hxDbfp96E+erCBqDPok4gYotbeA9s9IhmCL0QTq8
         oEtw==
X-Forwarded-Encrypted: i=1; AL+hErH6XquPnS8ixZq0EngK8xcsAfuUybvr1aeM1g53pcZ4P2VvsVNW/5sqxjVJGA7477NGIwMjUTNJN2TRIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ExMiqF4MZq1sWer9nN4kwB8QO7I/LtyyNEwFZK72c2jjNNslZ
	aLn+dbwk3qbi/x/QfLiKbrb/26ntXNM/xbYZE4AMVY1VdoPbX6/r7ieCY+50hUuSYeA=
X-Gm-Gg: AYBFou2Fkn+OZwhFlqm4/+npkFAQfAA2ibrhN79/QeJL1b+2GjLzUm5K2gQZbQoyL3o
	Vg0NmjX5TfbX4d35FvxAvd7/uzuyhkT0bf5WyVVuFV85WA9k3GHaoQ+wlOEqxvj3F2Ve4Di6RVk
	ZLz8mWUnUNRzHB4MCY1mn5SbKBC2wyOk15xf+3LyMCG2AkZkjhzQ80SEboeloEr6IPN4rp8PdlF
	dhe+UvMRm4h7xwlQAAdYJueQyTNUQwE8nq5lkjSnrIDFD+EedDjEvdywUGOHnJIEOpQn+MtT6K7
	Q5ZM7XTAYhd0KAahq82p0vAnNlqz4BFcXvRfkRhWXGlXSd7RLEjDtaPuyiKKH+uuh4Ct1AolnMR
	3V7fk/kzmvTX9D/ZO0AzrrlTUFufjHu81HtPXkYAfZxdAgPyj5WQ+XG94pHr2L09t2mXRkbsEz8
	MqKYohE9gOd8p80IMI18RBY/rWfDrYPHRCFWDiEWbUXzG5gmbl9Qu6IvG+H0CWssRdHjLB+b8w2
	aTtxAhD38//6D2DcyZKM2A31SBISIvKhlx4ZeZ5I8CtnpEjwsoLE0CSjlH/UgBpN+37bjxnNlZ0
	gM45yOhK5COnIZLBiJ7KnEhP+cTKIkjQ5e3C4H0QaEGpwKriK1VcUnk0ySFjpyKTKMsl0QtQIWw
	=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr46585025e9.20.1795160050056;
        Thu, 19 Nov 2026 23:34:10 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Fri, 20 Nov 2026 08:33:57 +0100
Message-Id: <20261120073358.10267-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 16014df9c087a..2d8b06c05ecc3 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,44 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
 &pon_pwrkey {
 	status = "okay";
 };
@@ -660,6 +699,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -674,3 +717,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

