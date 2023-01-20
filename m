Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950A3C54794
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 13:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjATNSk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbjATNSf (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 448E2C41E4
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:54 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id v6so13871410ejg.6
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ySBpf/g54h4mieeOX1iTHn4nbDJmcd4e2yinCvFCp5c=;
        b=LQoXIY51ocKZoiJFhh/AKSvIacV/F1db3r+IWRBBO5CRnSUd4/y6t+JPN0hZcOZC4j
         5g67O4XNBTR/+4FcVFML8g5LzcxfzWKtB9YbLXV3o/Db+9DuJBVvgDmf6VRweZz9QhDU
         bV1mIusIhlsezQ+F7aqLrpXr/4I4jyYEmNI8gosKdTeftWaoFn1xi/3E81QKglReGzWm
         TGMHSuUcV+YZiR5D5WDxbZsbn3viFZ1oQNXG1fdq0+VPKfTaNemr1mbtrXs9xNrEEgw4
         7JVC9CibLH/pdTT/Po5D4c3F3Oiyy4xXwS3aNWAxEZNeXLTRFj386RA7xlUos4xg0BOx
         gGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySBpf/g54h4mieeOX1iTHn4nbDJmcd4e2yinCvFCp5c=;
        b=Sbtpt2TJ8gGkroc6lw7WJEXgkBG7A3QVruJEJfH6zuCvmwW6TKHci7VIQxzXbtwztx
         X310Fk6pdfSN+w9y/cb0BHYhqpHGJfnTPAnOycojP3Zg2s2Mz3Jp8hyCiRbbIDCJkoOc
         uSrSZ+lt4I5LbbqRb3i398jcG1uYoMrB0nS+uxibnVAzg51kVqtenqKTr42ESSBVl9NU
         xlqezJrfEp377DDJOsskwqiC/n4ZjbkhRqMeJg4Pv59qfjKm6BD7MCHb7bKhLWRLvB7k
         Mef1WCW7ZN7oqGR1ao+Nl8JDi49BhqjuszGyI52lo+e+d38wopKxfhheUOPvrIsuLXky
         nBgA==
X-Gm-Message-State: AFqh2kpnyNAqOF+EfQMXvj/ve4JL+2KMvZyB9mJ9en3+kiXE9Kjpl4K8
        6ufrr8CAqJmOFfdUB6N1vHhpmA==
X-Google-Smtp-Source: AMrXdXvwTGSr0VTfDAVxv+4egpg34iuffH5U0RjzGKJRCWUe2ybZYxw/9OuLWcE4dBOerhoopk/deA==
X-Received: by 2002:a17:906:c7cc:b0:7ae:bfec:74c7 with SMTP id dc12-20020a170906c7cc00b007aebfec74c7mr14237590ejb.72.1674220492599;
        Fri, 20 Jan 2023 05:14:52 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:52 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:45 +0100
Subject: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
In-Reply-To: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12-dev-78462
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a node for the camcc found on SM6350 SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8224adb99948..300ced5cda57 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1435,6 +1435,15 @@ usb_1_dwc3: usb@a600000 {
 			};
 		};
 
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,sm6350-camcc";
+			reg = <0 0x0ad00000 0 0x16000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;

-- 
2.39.1

