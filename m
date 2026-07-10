Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175153EDE6B
	for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 09:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675383; cv=none; b=DHQkY/jLhL+AKjegkAx2nT/HclxMD5ifNVEEkcOu/inF2LotFiQMC1zs6STr7aF/YNgvgGtjs/dFwtc09QlK01Isw8dqlKVSOLc8RU2faqZXyeC3YBbhgi5sUUUcu/AfGEcislTdaeYwyvHv5O6B6bYVwHkgbQSyvqEqLZlZ+No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675383; c=relaxed/simple;
	bh=6vvvoS+Br7JM4+bO6PoXZDcYhJ0TxtZIz5yf5h8lYBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdDqiIxsxlzZM2nT23L7bYFIFs89RX0V4Q3sKmhD3XVuuhd7Tslvhco+HaRX+UjW+bbZaGsp51uD4QGZku9Ig9Znz3WyazCXh4Sh1LRZ2SgtGFs0PFeuODIKK1a4CXpoX0sxbUTuZD+8LtELgrDIRKZ/UFqD0NwjIID2N96W9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jjUNeS9/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jjUNeS9/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698beff7178so1313711a12.3
        for <phone-devel@vger.kernel.org>; Fri, 10 Jul 2026 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1783675378; x=1784280178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yg7ioh22XhaJVGdlXVxo6srFg4mbOi5uMGV4uuYdkyg=;
        b=jjUNeS9/hfWAi9hAA0YlXGQp5Cz7gFKWy/Ne7FzGYNLMi33sudxUlGYS2EtPs01nl6
         cGIYxfPK0+d17zg6pScVd2aONuSJrIlukGpKrK6iDlbyJXxf6vWqKsBk6R9sbqxEApDG
         51yPiXCa0q1WzlgiUC9SznzG4IplD/Yt1+P9Eju0fjbyoba+nnXd0+sJtK/AB6FTffuA
         7LnMkFaqCQ0GgxfIEVE2ZT1NN1hCkNdrsvnC9gFI3jHWm2IWhG74QxRGl8MBqbrlsXNV
         sVgdxxjDKQsWmVkTf9lJgyoHtsUyc6rCJJEg7iRKKYfClbTey++8xqPRI+eIKrBPC0FL
         VcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783675378; x=1784280178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yg7ioh22XhaJVGdlXVxo6srFg4mbOi5uMGV4uuYdkyg=;
        b=oVY1D6hmCVSKvChg4ZPTWUvYNu4sWQCIdK3fWeZOJ3Yr6+P0MbHBSim8P35fqpmRDi
         ix7RySRUQVWRCj0oOyK1/hiQWlI0mCOKDRZGEGFSaqK62AlZxTu8DFBDCBxwxsWpT4Vu
         nGe244l5aBB4rlufxLSVyNBbXcLbKEJZHEF+/tZSPqUD4vU0wp2QCmCvtDGwtb8wSQ6t
         HtW2aESV5RAaF6Fb7sI5BR5l9tc5K8wSDcmRZ07UuDzAOcyinEaDQ3olrC4kMm8GqGRg
         CWN1EzOaalE9BTCaWvgBrjgHzE1aMZfzeKpMfgg6l+CbK2/+JVdQT5hqrXtKgJ1hzFO/
         IjKg==
X-Forwarded-Encrypted: i=1; AHgh+RoKr3T2iCjvYqdV3C74l48ejDaFj+yn6H6sT4BUZol9HFbOv0OU9ImIzyHIY5kIpJYoWPjOIvV6uHsj+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx92vCRxaRh3FEI1IXcg0MBQwgg8exYYSj8rjyD5A6JAgs82TeA
	VK8+i0/FYan6xYBfhuyXHYCc4Gh7fWh6v2jB7OewDZagOQ6dq7xO1+6kBIMYguExX6U=
X-Gm-Gg: AfdE7ckgahjZ6OfVNJRQNb+N/6ZgWlBdmCXj4unZrSE277IOuDoFlRPOurwfLnDwUqD
	OgTDdc74jlUsDEDwjKbh3nMt4yrmBSq/MU+g/Q3/K3yqBkZpJzsFVarmZJvmvShD1syJsMxxPtR
	W8ltLIOmXwRxXAEadbSePpn8HMDta0UHkmFS/iP5a1dxTLKZd4l88BSvFEz8vufEBydSNHhWpbm
	tdNum5ByGHmGbvcA7aYp3TcRwCbFpHCJQwPAqZWYfPXmoY4zAcOHpSkQ+UqqYxMoQnBz7MoP/Oz
	IReind+jMrJRLULqHGUfHtWoGtwscPy1JbRDdnsF92uuwcLlcvN+DtGdpO2PfoFffmicB019iDl
	+srMzsIJ0Y9/xSIkizvg+8VdXh2zN/KM+yBAcCNWFNhgQjpDL14Ld4n/Pvlvxi7uooRHVgwPGpB
	YLJ5AmqqC41f1iUy20EX1cnP5U2zTqGMVxepas5bB4r7McYrF1U2Lb2FSTP1AlDKf6D0M=
X-Received: by 2002:a17:907:76f3:b0:c12:330e:ea76 with SMTP id a640c23a62f3a-c15ce18c17amr333319866b.37.1783675378323;
        Fri, 10 Jul 2026 02:22:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15dfda815dsm261785566b.36.2026.07.10.02.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:22:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Jul 2026 11:22:42 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: milos: add CPU OPP table with DDR &
 L3 bandwidths
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783675372; l=10846;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6vvvoS+Br7JM4+bO6PoXZDcYhJ0TxtZIz5yf5h8lYBI=;
 b=Yb7cyVD/7L9tLGDe6hKl9sNaOsQlKvBsiS9fkifLaKpyqyWG+flOdZL2RtSne7+2XIIDwbEAf
 icPmeNZ27FKCLt4BEeFtjzeN+6c6M5/YxtfWI2SO1Q+8lsYzXotXcy2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
permit scaling the DDR and L3 cache frequency by aggregating bandwidth
requests of all CPU core with reference to the current OPP they are
configured in by the LMH/EPSS hardware.

The effect is a proper caches & DDR frequency scaling when CPU cores
change frequency.

The OPP tables were built using the downstream memlat ddr & l3 tables
for each cluster type with the actual EPSS cpufreq LUT tables from
running devices. Note, that higher frequencies than SM7635 are available
on QCS6690, those have been added here as far as possible but may not be
fully complete. Additional OPPs may need to be added for that SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 291 ++++++++++++++++++++++++++++++++++++
 1 file changed, 291 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 8e288b5dfc58..974afd7a582e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -66,6 +66,8 @@ cpu0: cpu@0 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -104,6 +106,8 @@ cpu1: cpu@100 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -129,6 +133,8 @@ cpu2: cpu@200 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -161,6 +167,8 @@ cpu3: cpu@300 {
 
 			qcom,freq-domain = <&cpufreq_hw 0>;
 
+			operating-points-v2 = <&cpu0_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -186,6 +194,8 @@ cpu4: cpu@400 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -218,6 +228,8 @@ cpu5: cpu@500 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -250,6 +262,8 @@ cpu6: cpu@600 {
 
 			qcom,freq-domain = <&cpufreq_hw 1>;
 
+			operating-points-v2 = <&cpu4_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -282,6 +296,8 @@ cpu7: cpu@700 {
 
 			qcom,freq-domain = <&cpufreq_hw 2>;
 
+			operating-points-v2 = <&cpu7_opp_table>;
+
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3 MASTER_EPSS_L3_APPS
@@ -435,6 +451,281 @@ memory@0 {
 		reg = <0 0 0 0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-441600000 {
+			opp-hz = /bits/ 64 <441600000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-595200000 {
+			opp-hz = /bits/ 64 <595200000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (710400 * 32)>;
+		};
+
+		opp-902400000 {
+			opp-hz = /bits/ 64 <902400000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(547000 * 4) (998400 * 32)>;
+		};
+
+		opp-1113600000 {
+			opp-hz = /bits/ 64 <1113600000>;
+			opp-peak-kBps = <(547000 * 4) (998400 * 32)>;
+		};
+
+		opp-1228800000 {
+			opp-hz = /bits/ 64 <1228800000>;
+			opp-peak-kBps = <(768000 * 4) (1094400 * 32)>;
+		};
+
+		opp-1344000000 {
+			opp-hz = /bits/ 64 <1344000000>;
+			opp-peak-kBps = <(768000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <(768000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1593600000 {
+			opp-hz = /bits/ 64 <1593600000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1497600 * 32)>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2054400000 {
+			opp-hz = /bits/ 64 <2054400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1804800 * 32)>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-633600000 {
+			opp-hz = /bits/ 64 <633600000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-940800000 {
+			opp-hz = /bits/ 64 <940800000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (710400 * 32)>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (710400 * 32)>;
+		};
+
+		opp-1286400000 {
+			opp-hz = /bits/ 64 <1286400000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (902400 * 32)>;
+		};
+
+		opp-1401600000 {
+			opp-hz = /bits/ 64 <1401600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 1555000 */
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1708000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1824000000 {
+			opp-hz = /bits/ 64 <1824000000>;
+			opp-peak-kBps = <(1708000 * 4) (1497600 * 32)>;
+		};
+
+		opp-1920000000 {
+			opp-hz = /bits/ 64 <1920000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2073600000 {
+			opp-hz = /bits/ 64 <2073600000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2400000000 {
+			opp-hz = /bits/ 64 <2400000000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+	};
+
+	cpu7_opp_table: opp-table-cpu7 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-peak-kBps = <(547000 * 4) (364800 * 32)>;
+		};
+
+		opp-633600000 {
+			opp-hz = /bits/ 64 <633600000>;
+			opp-peak-kBps = <(547000 * 4) (556800 * 32)>;
+		};
+
+		opp-787200000 {
+			opp-hz = /bits/ 64 <787200000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-960000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 32)>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (998400 * 32)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			/* TODO: ddr4 = 1017000, ddr5 = 768000 */
+			opp-peak-kBps = <(768000 * 4) (998400 * 32)>;
+		};
+
+		opp-1324800000 {
+			opp-hz = /bits/ 64 <1324800000>;
+			opp-peak-kBps = <(1555000 * 4) (998400 * 32)>;
+		};
+
+		opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1651200000 {
+			opp-hz = /bits/ 64 <1651200000>;
+			opp-peak-kBps = <(1708000 * 4) (1209600 * 32)>;
+		};
+
+		opp-1766400000 {
+			opp-hz = /bits/ 64 <1766400000>;
+			/* TODO: ddr4 = 1708000, ddr5 = 2092000 */
+			opp-peak-kBps = <(2092000 * 4) (1363200 * 32)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1497600 * 32)>;
+		};
+
+		opp-2304000000 {
+			opp-hz = /bits/ 64 <2304000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2496000000 {
+			opp-hz = /bits/ 64 <2496000000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1516800 * 32)>;
+		};
+
+		opp-2707200000 {
+			opp-hz = /bits/ 64 <2707200000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+
+		opp-2918400000 {
+			opp-hz = /bits/ 64 <2918400000>;
+			/* TODO: ddr4 = 2092000, ddr5 = 3196000 */
+			opp-peak-kBps = <(3196000 * 4) (1804800 * 32)>;
+		};
+	};
+
 	pmu-a520 {
 		compatible = "arm,cortex-a520-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW &ppi_cluster0>;

-- 
2.55.0

