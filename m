Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CA7CC433E0
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:57:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFF8464EF0
	for <phone-devel@archiver.kernel.org>; Tue,  2 Mar 2021 13:57:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384051AbhCBNwd (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 2 Mar 2021 08:52:33 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:47244 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1575049AbhCBDwt (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 1 Mar 2021 22:52:49 -0500
Date:   Tue, 02 Mar 2021 03:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1614657077;
        bh=6Lqc99WHAgZVxNlrSG4NdxKORMThqAvTsVgRaszZvUo=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=pow8k2LzpEfvSdv7fU6cmpTWqEofb0PWomerf42KjWf3J8T22fCLi8lmo4lWdxDAi
         ZycHNc0ron5tWGsZzdiVy1eK/8AydwarBaJ5NviNecVV5jpx/79a8A1PQ13toUDY6Z
         +8BZxztIVuYF7xqzg30eBqCxeV7axv0aWTngpjDE=
To:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH] arm64: dts: qcom: msm8996: Add usb3 interrupts
Message-ID: <dvfyYKA9vnJdunbQ1CL-dgjXtv_1wYpRnezdc3PHoCyrgmfi5KP0Dn4MtaumQEpHIQAHL9tTdqcaCK7YJWyrdWXCrPeGd4uMh-nFeu7xQYw=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add hs_phy_irq and ss_phy_irq to usb3.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qc=
om/msm8996.dtsi
index 7eef07e73e25..b4b8d6305a05 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1754,6 +1754,10 @@ usb3: usb@6af8800 {
 =09=09=09#size-cells =3D <1>;
 =09=09=09ranges;

+=09=09=09interrupts =3D <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09interrupt-names =3D "hs_phy_irq", "ss_phy_irq";
+
 =09=09=09clocks =3D <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
 =09=09=09=09<&gcc GCC_USB30_MASTER_CLK>,
 =09=09=09=09<&gcc GCC_AGGRE2_USB3_AXI_CLK>,
--
2.30.1

