Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0828C77B7A
	for <phone-devel@archiver.kernel.org>; Tue, 30 May 2023 18:25:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjE3SZ3 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 30 May 2023 14:25:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232939AbjE3SZX (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 30 May 2023 14:25:23 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBE4107;
        Tue, 30 May 2023 11:25:00 -0700 (PDT)
Received: from [192.168.122.1] (84-115-214-73.cable.dynamic.surfer.at [84.115.214.73])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 02884CFC40;
        Tue, 30 May 2023 18:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1685471068; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc;
        b=dP29WC2jWAw3eDkq3YlsuCZFMJvF57n8gz81zEyHwTOotNI2JuX1KFxiX5BwXZ0ay
         mKQxYm6OKnkttZLZJx7V79s54hvdL8b1hLdbaN/CKApMGGsY2tgayUvf+dhCERKfYN
         Ep72QgIpzw82sKX5/tMpBg3pK0hbl0JtsMDk6t2Q=
From:   Luca Weiss <luca@z3ntu.xyz>
Date:   Tue, 30 May 2023 20:24:13 +0200
Subject: [PATCH v2 3/7] dt-bindings: display/msm: qcom,mdp5: Add msm8226
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-msm8226-mdp-v2-3-e005b769ee28@z3ntu.xyz>
References: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
In-Reply-To: <20230308-msm8226-mdp-v2-0-e005b769ee28@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=u5Pebo6nZ9QZwWZHlwTcKLHf8y3TFQkR66oBJVT1aM0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBkdj9T0sIy4PC26+ocSl2cCiDuQP8enClPj2cu3
 GlK3REl2cyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZHY/UwAKCRBy2EO4nU3X
 Viu4EAC8XjDFE158iyAWLz7x8ymaKvqDWnbUbPslUOJWlp/g/UjcYwLCcDMsIsTUHxVpc1k06iV
 +3OJZRfvdbvCmqJdNF15Zn+lCa5NxBgzZQvhVjsNZzyNJIGm9riLjltgFvgc6POZ2gTHyTA2KVS
 dntLbCXXOjvs/+dxfVLcAbM1hige+n/U/iYwIsltE9hJ0M5HaRHx3rzR+xVT7mX9UTAmN8m1U2j
 5KHoSfkZqgINHc33E2IksDT5nRGg1Os8Mw11gPhipvmUPelVc0bcd3DkwjXWAdndSHe1yNO+J+0
 Ckug5MBSAlSdPcVMmKULZ+PqQig1I6qSu5IXvVjLH2OVKMHD44AdgkhDYPmdbSSMF45S+86gpfp
 hcyFF7JiFllC/s4RWkgDitHxGgMIu0Vl3ztT4ciFk8agaKS4rjmgzdWxZu7z0YOS7hR4BvAq1oU
 l2rKE+/gJyfpTc6j6HqmKVnZTCPRUOY3k+4EjZcFBXzjl6fPuFMmbQiEahAfwq82M+WKWwQvCmw
 C3SYYKD28NlyrNwpHhGFKdwOwR4PZtkiVKCWkEQuGAdk/BI4DAo2f4eLxsVljzuPR8I04mtzKVc
 WrFyShZWE/S1XkIB6p06BtoVe2KsmtgqyKCRsIajFaIVkjlPWvFWP3bGSJ2lSvVrmWK7PqSwWpc
 ucFaMaVnUxD34RQ==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the compatible for the MDP5 found on MSM8226.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
index a763cf8da122..2fe032d0e8f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8084-mdp5
+              - qcom,msm8226-mdp5
               - qcom,msm8916-mdp5
               - qcom,msm8917-mdp5
               - qcom,msm8953-mdp5

-- 
2.40.1

