Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2373E00A9
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675381; cv=none; b=kPxSQT+53VWr755IQpYjnV50NHsnTFNGIog1noi1BjhjjcjEfz4kzQhY0guvEhsaYhBlinWwpfwtR3aoRlnudzTovkRbYI7MeV8hpqziWccpoAdXpuH1NFqAPI24P6N8OtHPy4Y4gw2H51TWRvUlAWj0kHR6k68Fp6L3o1wzWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675381; c=relaxed/simple;
	bh=MKOhRPK9BzP+Ba1kQzcE+8jxLp4Hbza+J3F5k7LQQLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gxHYeRbEESjtg8e42evyNfKJBdG1fzT9n2pF7pjTKqcpzc3k27VJgA1cV1SErQjmVF8fm7TGqSUUE3itl7uRi4tlzreHBrnKwHIfchsdt8FX+L3tHyP+E+z7KLN7FZpm7Xm0U4bHoQSsk4tIfnehQUXN6bDWFwZUAc9QIpNToCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FUrzNPQo; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FUrzNPQo"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15f47e6297so91271966b.0
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675377; x=1784280177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2PljI4ZF98i/3jw94W7rpF3nBz83urTcSx2ZEy+Me0=;
        b=FUrzNPQosMBvoBVHxYq7yYmSg7EcDwfXQ1QSVG1BAUbTYsLEelQqmx0FtqUBR9JGo7
         ffsfM067neuMHOWVbhNgFaH9e/yiKciWjXymaQRFd/Fjf3+EsMZGNbMl5ZTH8293XacJ
         5uskzyP1w/mqfPnqT5UXxlsJkjEUDJhZ7TqCsVsyNRi0LyM84RdGfB6g+PE+23t25B2C
         xrSXUbHLJtG3SadijssjYzTnxqIFhwtd5rZuc0fFEevJJ9EfqLiBtdQEkoFAKws3YzdG
         7Tfrqt9LxoXo8Q4m3rKp1J4pGj04X9V/uoGw3/Je0ZQl5SqXEsCHIm9zmmpfSArlGtDP
         mztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675377; x=1784280177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2PljI4ZF98i/3jw94W7rpF3nBz83urTcSx2ZEy+Me0=;
        b=a1ndk1ko/sAoujPvwHz+skwoFQDzU1NCAEgmLI0XCPlxKlsIkqHkU8R9cPg1oXmavG
         auZzhHnNPLdrQlKOYaLKPofKf+9Skuu+yMRzqY6MRS2OKuS677015+JbeurGO2nUhAnE
         b0rr6/S3Msz7OYQJZwyjEnSTGV7ylq7y86Rr01t40M1No9b4nSjloCBJ363hvsNiVaoN
         T8P8QuYWZVTZBIN6s1oOCQmZzUyuBzQGqSDw/CPrbinOxhy0R9OvBmKgm79FQo8ht5ZR
         puJ9dHo6512eSzkg6JjpWPOE1feJTtNIDIAXWWvbBBarydAFflJZL5scr7/aG+cFIFI4
         em/g==
X-Forwarded-Encrypted: i=1; AHgh+RqmvM+CrpEEMvPQgYmupXtAd+/keUQmxeIKBnsW3TtHkRp5c52jaqowSBXuUkZdEwpascFwJX7N7v07UA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7PdAGTLm0bNg7ppQeFk3/cftvFNIZi6Y7vvOQ7ILzgFIoS+D8
	yDEGyiwMkclvj7rR+rQw4L5iBjDnaxsyRxgC4uo+QsUzIEWQ5NLMSDS+wZ6LoDdLl2Q=
X-Gm-Gg: AfdE7cmmBuMFRDTaKJeTQX2qLWDjviJxPWkSStPgGvbRM8cYE+1/GqkkQPLpm8WDEhY
	QYfdw1lebdAdRMXdfd/OGA5JdzsJsE/Q8N+wzGkve5j4Uc5CYp3Q8r3hsAe29XGEcz0pb0Hz2Fx
	ePvmnXfVa2qatwgr4yaahIR1eZ4TrTT9Df5fTD5QlD2AQRL0BDERdsQpZhAdcI2jrVv26FGF/7Q
	L+VMJeiJMpCbRL+iKZjAX+Bk+YDSv75jo4g+Q94uJ01uMC5dojWwuH8U0/2OiBz/EhF4NK4jOu3
	IMFSKDMXrHWv3occWwxoN2ET0Uy9CximxClgTeV+xsHum5XPwE/ZmfDn/chb/bstvayCyFrJNTL
	rmxLKMHxZgesHCNAvMAa14RVa1peGgbtgNSg49L99JAIFSVbpTAHi6Yy/ST8buAseyqmRIWaZrH
	xipo0IqfFZFVXk7+B4vqAZuGFy2cgp9lEO2qs7utGTg1CjD3QZHqkr0+0f9BWytR2rWnE=
X-Received: by 2002:a17:907:76d2:b0:c12:7c80:8844 with SMTP id a640c23a62f3a-c15ce0c0b28mr312764666b.41.1783675377205;
        Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:41 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: milos: add CPU interconnect
 properties
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-3-ae7f4b09bc77@fairphone.com>
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=3619;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MKOhRPK9BzP+Ba1kQzcE+8jxLp4Hbza+J3F5k7LQQLE=;
 b=mJD3v2Seb0xmqYIKaKsx0e+KlFU1SZrgJW2OdoDBPr3JfIv9SYXWkvffUlTG+bZV5kOSR2efg
 7uWrnUEnWqcCm5aUZf93Sz17FlJtoXMz/KpAWPvedkjxG4A2sd/PG/6
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the interconnect entry for each CPU, with 2 different paths:
- CPU to DDR
- L3 Cache from CPU to DDR interface

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 1172a4f6adab..8e288b5dfc58 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -14,6 +14,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,milos-rpmh.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
@@ -65,6 +66,11 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -98,6 +104,11 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -118,6 +129,11 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_2: l2-cache {
@@ -145,6 +161,11 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 		};
 
@@ -165,6 +186,11 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_4: l2-cache {
@@ -192,6 +218,11 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_5: l2-cache {
@@ -219,6 +250,11 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_6: l2-cache {
@@ -246,6 +282,11 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
+
 			#cooling-cells = <2>;
 
 			l2_7: l2-cache {

-- 
2.55.0

