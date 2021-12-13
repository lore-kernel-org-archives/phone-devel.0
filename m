Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145E1C433EF
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232889AbhLMIYF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232912AbhLMIYC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:24:02 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9BEC0613FE
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:24:01 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id y12so48554729eda.12
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZhOSSwiixjkQaiUtFoSNPK59bnogS0Q2CCvpwHx2IiQ=;
        b=Zucq++Xv88DeQ1iG38WCmwhZw4g3OMp2CU8lPbjyjN1/kryBxu22+MVoKHkACuqxxM
         D5CQB8WLAglQX2qBqG2k7UA6SqKI91GmyDzaNrMBzfeN/fhlZsz6X7HD6banWanJH2ou
         elOMqfsNeeBtOJ4Ep7OvHE5RlKdcpFSEnSKT+d1DLT0SigccI9bhdXJFGL8ZU1E7QF6e
         4fAzW1e2V0IpL3fWJ3y/tNwrk0i0tspOH0M45RpoEoaofTr4AM7uu6VjDZMTiIrwAXi8
         CsYQScHhpobZVG3W766C9h2UreUbB/AvvE2U5X7FahD26sjVuzHfLGErr9JQsOWqgz+6
         vI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZhOSSwiixjkQaiUtFoSNPK59bnogS0Q2CCvpwHx2IiQ=;
        b=GKa+ZI7EUqb9Khc+B9Uu7tXJio2Oz/aRZOM8mZHgtjtwXLULtA5EP540BdinRy9Mn+
         wEnJQ8Ut7o5/9BhwLE+a/6QU1u+KBhDp/AjMosesYpRqgXhv76OUBVSzQFIkdJTndrLs
         LVQ/MIz3NDQR7OaPvJQ3JNfhsgcyFCa3yORjq/ZSRmMcyI/pmryWVTdkrYLCBCWktRJ1
         ioJlZAyqGClOruQVIiTu0770+92f6wpXqlGDlQsl2TcC4Kz06Ilnu+sne8m795TL18bw
         KmyvSKsdL9ODIvfkSIEB2Ng7L5B3WGHYSWG8omhdJTK98GV7K1WOqQJpHo1vqsIScY1S
         BnYQ==
X-Gm-Message-State: AOAM531ce417nv2QCuk9aZi3g3WJQNIoKV1on5b02Q6dH+QJW/GyK4C3
        WitSi6nsuX6iBQgeh/5W2J/2yQ==
X-Google-Smtp-Source: ABdhPJwCQHgH3NZYftawTh8HdD1J/sqHJn1qgoXM77QB+mKBiiAUDyKshgkAdIkYGpscW++IuYcy3A==
X-Received: by 2002:a17:906:388c:: with SMTP id q12mr41543245ejd.281.1639383839994;
        Mon, 13 Dec 2021 00:23:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id nb17sm5535561ejc.7.2021.12.13.00.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:23:59 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] arm64: dts: qcom: sm6350: Add ADSP nodes
Date:   Mon, 13 Dec 2021 09:22:05 +0100
Message-Id: <20211213082208.21492-6-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082208.21492-1-luca.weiss@fairphone.com>
References: <20211213082208.21492-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the required nodes for booting the ADSP on sm6350.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 9f9d4d916470..2ae7899bdc39 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -361,6 +361,30 @@ smem {
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
+	smp2p-adsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <443>, <429>;
+		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+					     IPCC_MPROC_SIGNAL_SMP2P
+					     IRQ_TYPE_EDGE_RISING>;
+		mboxes = <&ipcc IPCC_CLIENT_LPASS
+				IPCC_MPROC_SIGNAL_SMP2P>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <2>;
+
+		smp2p_adsp_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_adsp_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	smp2p-mpss {
 		compatible = "qcom,smp2p";
 		qcom,smem = <435>, <428>;
@@ -499,6 +523,73 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		adsp: remoteproc@3000000 {
+			compatible = "qcom,sm6350-adsp-pas";
+			reg = <0 0x03000000 0 0x100>;
+
+			interrupts-extended = <&pdc 6 IRQ_TYPE_LEVEL_HIGH>,
+					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal", "ready",
+					  "handover", "stop-ack";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
+
+			power-domains = <&rpmhpd SM6350_LCX>,
+					<&rpmhpd SM6350_LMX>;
+			power-domain-names = "lcx", "lmx";
+
+			memory-region = <&pil_adsp_mem>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			qcom,smem-states = <&smp2p_adsp_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
+							     IPCC_MPROC_SIGNAL_GLINK_QMP
+							     IRQ_TYPE_EDGE_RISING>;
+				mboxes = <&ipcc IPCC_CLIENT_LPASS
+						IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+				label = "lpass";
+				qcom,remote-pid = <2>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x1003 0x0>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x1004 0x0>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x1005 0x0>;
+						qcom,nsessions = <5>;
+					};
+				};
+			};
+		};
+
 		mpss: remoteproc@4080000 {
 			compatible = "qcom,sm6350-mpss-pas";
 			reg = <0x0 0x04080000 0x0 0x4040>;
-- 
2.34.1

