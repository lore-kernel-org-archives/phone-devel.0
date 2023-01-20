Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E350DC54EB4
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 13:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231143AbjATNSm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjATNSg (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 08:18:36 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B34C41EC
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:55 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id ud5so13886737ejc.4
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 05:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2axkO0jltwzlj2edHmm0m8ykLK/H8pKwFqLtIcLUF4=;
        b=FtbwFXXoIuMD8AKvtNShjyzUjVMbKQT4bzUsLP5ez7QfmNmOiFV2LlqDXbzY0oAUNq
         qlJg0Bz10QrKUypF06uLEj5+KXUv9itHcV5pAgdEPVtEAINswQaDwZJzoIAeCKVgPHEm
         iIbepClLsO0YwexllhSmJ5BBD/Jqtf4gG4l9hbkz+LyqKy6DenpC0pKsmfnNh8lVt2NZ
         JR2q8krQvhivMXRkiFEVOglZ0deWLgnYQN+7ZfSM5m6KlCj6eCUZxNQtx16FY6Mm5yF2
         cscGIiKNK/zol1hikoqh2MsZqsjKiNbFa0aNb2txI43FpWiZmqCu/a8FuzudbgHQ92rW
         lBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2axkO0jltwzlj2edHmm0m8ykLK/H8pKwFqLtIcLUF4=;
        b=Kbc2rMLB3XOBsh3z30iQY2LwnjnIE9RvrZ3o2bJz8+uEVzkqji0+Z34o2LUHW/lRFq
         bwGxX1pEjCRBYz6zflLKBpKGCe8xj33cAmEs2AHs0Rivn76YyqRkb4k6WG1Cb0SFk8kB
         XS8ECvpzf/CEq4R2he2BI3MphK7fRAvK0qScpkoIgAMLOrBQhB4xKz0DNIttRYNJIEmy
         O8t1NEr0lsqjFqgBrnk/ZjhKEmwZ1ocDiX/4Q5ZWBeor6BjSuTxQYH7q9GIMxT4QsJ6n
         NKEoJWO0v2YcZ+uOOHF7LQSLSbpo+Cv0WGVmPp47CkKvrLRllJNPZo4e/sOm+Zaxpn+X
         jgMg==
X-Gm-Message-State: AFqh2kqR1kQrwxqfrjLJ50xW4Wicpxm9hdK33o2jGt3hWlke75v7Txu6
        hU2u3RVuYjbleKcmnaYVP3gFYA==
X-Google-Smtp-Source: AMrXdXuNj7H7WV/FgoO6xkTJ3TK+NZyaRSNePNvZZway2ahmyVQdBgmsY5nhwdolCyRMGfSuAuWG8g==
X-Received: by 2002:a17:906:1c81:b0:86f:d1c4:ed08 with SMTP id g1-20020a1709061c8100b0086fd1c4ed08mr13855278ejh.69.1674220494108;
        Fri, 20 Jan 2023 05:14:54 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t1-20020a1709061be100b0086f40238403sm8063276ejg.223.2023.01.20.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:53 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Jan 2023 14:13:47 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI
 busses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221213-sm6350-cci-v2-4-15c2c14c34bb@fairphone.com>
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

Enable the CCI busses that have cameras connected to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index f0e7ae630e0c..ed0cb70849d3 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -363,6 +363,26 @@ vreg_bob: bob {
 	};
 };
 
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c0 {
+	/* IMX582 @ 0x1a */
+};
+
+&cci0_i2c1 {
+	/* IMX582 @ 0x1a */
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	/* IMX576 @ 0x10 */
+};
+
 &cdsp {
 	status = "okay";
 	firmware-name = "qcom/sm7225/fairphone4/cdsp.mdt";

-- 
2.39.1

