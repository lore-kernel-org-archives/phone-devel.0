Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1E9C433FE
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3196961354
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238961AbhI1R3I (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Sep 2021 13:29:08 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:16215 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242090AbhI1R3H (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Sep 2021 13:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849692;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=SVUrBCI7UYa2hA+1oVubm58FINBZ1hT8WY6HZHT9k8I=;
    b=VlEMZBfdcoExr+1qWRjrXd74JVTNIQvH2Cz9NgaURTuIVP1+c7+50ba+33vOga3Sdz
    LDicNQ0e3JEglvOvR+amk6x1h9lXGpmWr9XerVMYqiRqG9lAmF4yJsnQuU6R3RtW9//m
    llnuqkd/57ayIXeyvq+wTUp9Ovo/ap71rrlkMFj4+cUkiix5tYmsXfmfKjcWPfyq4/KK
    OXyCpS2agY8tl/UEzyuD/utX75eWN13VhMCD3CS4ckJtN61jTTcwW1nM6HR6dd+JtA+h
    ef6qVCROUcNHsOi81cWXHbuF8nD3SIfYqlJHLG5D1NHLbXuZ4R/u9pW1rbx+sqARUOWU
    N0Ew==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLVoBQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:31 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 10/15] dt-bindings: soc: qcom: spm: Document qcom,msm8916-saw2-v3.0-cpu
Date:   Tue, 28 Sep 2021 19:12:26 +0200
Message-Id: <20210928171231.12766-11-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the qcom,msm8916-saw2-v3.0-cpu compatible that is needed
for cpuidle for MSM8916 on some devices with outdated (signed) firmware
which is only capable of booting ARM32 kernels without PSCI.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
index d68c002527fa..07d2d5398345 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,spm.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,sdm660-silver-saw2-v4.1-l2
           - qcom,msm8998-gold-saw2-v4.1-l2
           - qcom,msm8998-silver-saw2-v4.1-l2
+          - qcom,msm8916-saw2-v3.0-cpu
           - qcom,msm8226-saw2-v2.1-cpu
           - qcom,msm8974-saw2-v2.1-cpu
           - qcom,apq8084-saw2-v2.1-cpu
-- 
2.33.0

