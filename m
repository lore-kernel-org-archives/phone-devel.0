Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB1CC77B71
	for <phone-devel@archiver.kernel.org>; Fri,  7 Apr 2023 07:46:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236512AbjDGHqX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 7 Apr 2023 03:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbjDGHqV (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 7 Apr 2023 03:46:21 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 929EEAD05
        for <phone-devel@vger.kernel.org>; Fri,  7 Apr 2023 00:46:15 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id 18so6717996ejo.13
        for <phone-devel@vger.kernel.org>; Fri, 07 Apr 2023 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680853572; x=1683445572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gb/NJByikwNeC0y/lKpExe6RRbIL2UvmiCGNOX7UGPc=;
        b=qBKLwA4mq4ZqfHlszARRRXndkFRl/cUyzjlKK3GBMGlP3Vh6pgrRFliyor7ZGzVn+Z
         UZhEGfNLPJrAirV2d1w+bhHULRry6YWNn7J9mQg4hD4JVl4j4oq1jdwFEsrswtiDhZjw
         HabH+dzNu5oE833nqdMMTjTZej6m9hdDuCXxrXHOgGlb36iLUMKyFCTUqJf/khnMSeaY
         OyNiMzfI/10sPBpffIZe7arEloxC5WmRvHZ7DF8LUCq3rEFFMvIJueKmbfq9TVOmzGhA
         HWdo2HW9gQJvSabJntsGYbatJby9tqBxloUO2Yk0yqClsPLJ04rQhRhpPGdNhPE5/gIR
         3zGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680853572; x=1683445572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gb/NJByikwNeC0y/lKpExe6RRbIL2UvmiCGNOX7UGPc=;
        b=TrrXke/y9jIZWB5J+EH2vX1bRfhWKLsKcUr5JUwMsd4ZEhk3BSRiyB+3WWiE8UWBzX
         5wW64ULIpylmB7WW5lQZxaI437F+10RXaIJRC/ogroaDxOHiIqwszb5892IIWbtAsgKX
         id/NdCU/KBq5G2Qq4fbDe7sERF02Cj3letMO40weQdm5jE/x1E2GeFidJkIIRrnYzSs2
         CEBVx6rbHexfiXm/4FbRFT0aJkXiKh3LhWwpyepji0LrGpSopswzqe0TOC1pdSrH/tbs
         LHyYvAsXAoWqizDvB7UUfnQ3M/27ALItgIxccbdmxecTgIxjNgcocJNY8g9yjA8xzDcD
         yzSQ==
X-Gm-Message-State: AAQBX9eTi7gQXagtvhCQqidy450qEocTNlFJZvicsuXXrm6dJK+hKMoG
        al7c7dQhFnil4GxMS7MirbMtag==
X-Google-Smtp-Source: AKy350bQ8Gx7PXKz9FdJofFrLi+INHIfe6L0eIwsWx6Pt+gyk1r18TwO9ZI+Ymc1IeWXi4joncB49g==
X-Received: by 2002:a17:907:3183:b0:92b:b4d9:3f07 with SMTP id xe3-20020a170907318300b0092bb4d93f07mr2202341ejb.14.1680853572711;
        Fri, 07 Apr 2023 00:46:12 -0700 (PDT)
Received: from [172.16.220.24] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id sa28-20020a1709076d1c00b00949c04d1c64sm1762378ejc.41.2023.04.07.00.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 00:46:12 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 07 Apr 2023 09:45:44 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: pm7250b: add missing spmi-vadc
 include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-pm7250b-sid-v1-1-fc648478cc25@fairphone.com>
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
In-Reply-To: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.2
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This file is using definitions from the spmi-vadc header, so we need to
include it.

Fixes: 11975b9b8135 ("arm64: dts: qcom: Add pm7250b PMIC")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index d709d955a2f5..daa6f1d30efa 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) 2022 Luca Weiss <luca.weiss@fairphone.com>
  */
 
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 

-- 
2.40.0

