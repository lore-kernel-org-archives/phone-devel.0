Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F62EC4320A
	for <phone-devel@archiver.kernel.org>; Tue, 10 Aug 2021 16:44:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34BAA60FC4
	for <phone-devel@archiver.kernel.org>; Tue, 10 Aug 2021 16:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236256AbhHJQow (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 10 Aug 2021 12:44:52 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:55912 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhHJQov (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 10 Aug 2021 12:44:51 -0400
Date:   Tue, 10 Aug 2021 16:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628613863;
        bh=zptcUiHG71qiixpHJ5ww1P8oSerkuAaxipqsFMPDPAg=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=aFPycwSGKSD7jxZxqETyPjdEXLujEeQTDCnXl5l6drAV/gpt+pHZE1Q1wDuEUtoaB
         RTif+Wv41wZCZnBPSyg8EvsJvhbKKR7g4XDQn6f0rsri9XgtKpsE/lyFz0FYC76pg6
         vt1amJ9h9c+RKnZChuOPYE4xSFZQRRV7jwgUJb5o=
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        jassisinghbrar@gmail.com
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        sivaprak@codeaurora.org,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 0/4] Add SCM and mailbox support on MSM8953
Message-ID: <20210810164347.45578-1-sireeshkodali@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This patch series adds support for SCM and mailbox as found on the QCom
MSM8953 platform.
Since all SoCs based on the MSM8953 platform have the same scm and
mailbox configuration, a single compatible string is used.

Vladimir Lypak (4):
  dt-bindings: mailbox: Add compatible for the MSM8953
  mailbox: qcom-apcs-ipc: Add compatible for MSM8953 SoC
  dt-bindings: firmware: qcom-scm: Document msm8953 bindings
  firmware: qcom_scm: Add compatible for MSM8953 SoC

 Documentation/devicetree/bindings/firmware/qcom,scm.txt       | 3 ++-
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml    | 1 +
 drivers/firmware/qcom_scm.c                                   | 4 ++++
 drivers/mailbox/qcom-apcs-ipc-mailbox.c                       | 1 +
 4 files changed, 8 insertions(+), 1 deletion(-)

--=20
2.32.0


