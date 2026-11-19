Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=nBQlzNQRqwS7FLVAjEUsHp3f1iipQGCH6ALP5av2ilGakqL4dQ0goEuPU7ViLb95P6yh
	 F0VlQTlAFJc9P8cE5ZUCp2FK5P/tSVaaCmbXFLSvD+x2DX1KNfLTwjSCIQwpeiODvkC74
	 TK9MhyYvREAmvUXvUAlSZMxhBLwY7z7bF+lhIj4243PKx8gVZyyrHcgU3Jyjv+fO0gFdI
	 mTS0iUh33mpLWhLPC+L51AeKnmKzPmprX3c66B6muxP0mufNylvkzSCD7MAJ5a4s1jQL6
	 OgO0LnGCT6A/I+Jpexazkfrae1jeaiR/QL2m6AowM2rCs7GoOHTbH6grw9jqi9GIpaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
	b=nTX1EQ99MxZNoyKFgMhdJL7A8vQoQc3w8MJnXxFDz6YYkFHLu2wszVqWACN4O0wJxaLN
	 jzuZLizL78mKlaxF0ekHKwQbbTOzMP3+DYnfpJPr6kbMlwnuP8mLwSTv1yr0bx4wR9V6G
	 90gFm8olrvzEWUeFpkD/IPc81CcjnYAlvPgdTAMv95tKTAtVVXhUMmS4WMl0FYaG5WLQ+
	 ekqEuY/PGCtDO8ev5aJdV6FSqyCXfAB3XjK+lXwO6Ouv0OlSYTFiQFcLaet1JbstkGbH8
	 UZ9x0rHpSceNt3FomUaz30EDQisLymMk6g1Xr21mGi+anUuMEs/1qm79dAk2MlF/mmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D460A6F62
	for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 16:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 815D460A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWxDVM+f
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so20325685e9.2
        for <phone-devel@vger.kernel.org>; Thu, 19 Nov 2026 08:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107273; x=1795712073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=tWxDVM+fAapdNLO5oAWMSWtAihRfVvePxg2vTZOMR1EAAz1T6LOrtjMhCbIyJukujb
         CK8xrym1k13GJeg8eVnp9YpO7I8Dml4JbqzQPDDNTW260lmsIw1Dy+21wMRdeblnV8GR
         rHisEaxrRdyV7+Iatn88T/yvi4WJXXkqtg4Teig9r/bD8OS9HsoYZmSR6+eLHfTP+TaK
         n8Q+MisHDTFGPTSqSsmHX1qPdRCEoAmYQNGhRWvVjUQVo5FFWYJO8fp22aEacncxuyIU
         NufuF4F5ndIjeqeCEhW7rSePkv+nfoUuAC5W8V9Omo7ibEFqK78trnrigzgQ+6gXRKnz
         5NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107273; x=1795712073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8HAdjmJFS/vSTReOhqoIJm4R7O9SEUoXAZM3wxNxKGg=;
        b=LmaWO/cef8UOVT/0KRPdPLJouopiOpA9PnquSaWe2Mjwmyuds2mx5U5/U39wKeLhhN
         Ju16uzxj2oYEZbJX37KzFXJK+QtljzyQ1Fhjvv+kRnoaSQ0mo4FmUACOQCKnZBZG8mpD
         ee8PwttqkYlmYsQSiqXaT8YEU9Ru1ekwLpY2OejT1AxRKZz1oUhtq2Jky50XSBCY1l6M
         9YxXB1O7MB/IVP2VHL35GpcoRgappds/x73nns787eNdG9hu6J5r6HFG9u3qhxyrIuMB
         /AWhAOn5JkVFi3q2Sa3ihJUoTRu6WivczlRb3WfKe66VismTeUmEV1nxYshjxp/rNAua
         tP6A==
X-Forwarded-Encrypted: i=1; AL+hErES/a34yWxlWnbmh21Ikkj1vsSqHkwcHQoxAQL/9zQ0ySIfvOsZ9QvtGbJX8w1egy/z6sNyygW2wLxzwg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+fmyzlqarcTKxyjYoeHWQC+rC6NorfIVNOIdAgbi7VmyeNrRvz
	RhtiBRqvrQL34vyxbkWlaENQLx8GB9AmJ4OB3vZgx1ihbLHR1XQQS5UG
X-Gm-Gg: AYBFou0MrD/p3zoX+35SfbS/+JHt2KVqrxIvOX9VFAXxm+15Jf7QPO7LMo6VkCRb1mw
	HieVT+9H9qb9RFCxfFacjnohIHSOUeevvoyOiv2na3FMywMCbM8xIrBh8MJAwNnd4+UwbH84Xjn
	0RDmX4FRwcVpBz4D691Pybez8uBuouGyUTOLJbTtcETq2tlRNH6Zw+rWJzD3h3oa+nm706TdRO+
	3zgnobRXMjgQ+O/GKAV4vpjDa6AL0pShGsdUZbkV0ARX824efeishTBEUTJdQSWGhAcopPsuxTv
	L/X8138G8pZqa3s5z0w+S12fQ/GGHFnmK1P3QxxYvSt7WUzZvxe8fkX3fCyq9Naog+jOJ45l1UR
	686ZK1IGAOrIopV/yTeJ80TDRx20OYcjq8EDVcGAlvyS6kYFUTyyPLel11xlvyJ0GgOJllKNNP1
	QLVvcRRotBYAro1joh01gSrtIh+6WPWUCrH8SxjhGho3UWzfjDJWySztsBxTLzEJmpL7KsCl6nn
	uTkn6RMy708cFSJEOtscgytJut6UuOQMFV7ogP6iy2qnQdjqyX4kfc/IwV5Os9wCxSJ6kqVKkc4
	rJT9B9hl3jzBp9jbMMaVmmAnChXtMSn/7brWqLcAjWdhrcdp9y8TA1YsXsMqpr0IBMXdXyttfKd
	M
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr1984605e9.27.1795107272825;
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:32 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Thu, 19 Nov 2026 17:54:19 +0100
Message-Id: <20261119165420.24466-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 160b6f4c98b17..3ce8161574a95 100644
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

