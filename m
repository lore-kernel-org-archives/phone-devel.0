Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DE9C4332F
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 17:44:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D8B606A5
	for <phone-devel@archiver.kernel.org>; Tue,  7 Sep 2021 17:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245663AbhIGRpV (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 7 Sep 2021 13:45:21 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:39628 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344172AbhIGRpP (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 7 Sep 2021 13:45:15 -0400
Date:   Tue, 07 Sep 2021 17:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631036643;
        bh=VaR38HersvdojJ1BJmiuRcWvLuT4F3ED5+MNyQ16jCc=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=v8bLo1cUdfqMfJpgT1Yln7EcHo2+8qtjjLMQr3jMbGExWZeuKTVUsS293+sPB7L1A
         SOHm856g62CWB1Hya18sXHWXyrNlTD2r1bElZ5dQt9fWlW+gjrk+Z8mR/3IEz66ekj
         NA5pqwbdEjLfVeG0ySxC7fcIlafC0uS+Vixr68Oc=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v4 0/2] Input: cypress-sf - Add support for Cypress Streetfighter touchkeys
Message-ID: <20210907174341.422013-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This patchset adds support for Cypress StreetFighter touchkeys.

Due to lack of documentation, this driver is entirely based on information
gathered from a driver written for an old Android kernel fork[1][2].

[1] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/drivers/input/touchscreen/cyttsp_button.c
[2] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314

Changes since v3:
 - Use device_property_read_u32_array to read keycodes.
 - Read status register into integer first to check for errors.
 - Use bitmap_xor and for_each_set_bit to check for key state changes.
 - More code style fixes.
 - Add MAINTAINERS entry.
 - Dual-license DT binding.
Changes since v2:
 - Code style fixes.
 - Added copyright statement.
Changes since v1:
 - Changed version variables in probe to int to allow storing error codes.
 - Fixed some issues in dt binding.

Yassine Oudjana (2):
  Input: cypress-sf - Add Cypress StreetFighter touchkey driver
  dt-bindings: input: Add binding for cypress-sf

 .../devicetree/bindings/input/cypress-sf.yaml |  61 +++++
 MAINTAINERS                                   |   7 +
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/cypress-sf.c           | 219 ++++++++++++++++++
 5 files changed, 298 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
 create mode 100644 drivers/input/keyboard/cypress-sf.c

--=20
2.33.0


