Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2396EC433ED
	for <phone-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E713461132
	for <phone-devel@archiver.kernel.org>; Thu,  8 Apr 2021 16:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbhDHQVT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:21:19 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:50054 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbhDHQVS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Apr 2021 12:21:18 -0400
Date:   Thu, 08 Apr 2021 16:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1617898865;
        bh=gmq6lQd1NWtTBrDin6uNBMByAAtGgaIcn+myFTSLQ/s=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=OzsyUehO7T00DunatQBQ4rsCMr+sej+mRiMP0VPZVxZr4wNcMilHRWW/se56kkLSE
         BvIjym1RmGVMUKS6b1SxnDecpHiMABKgCBXViYpRR1iiMhgJxMDdwylME3d2tvtFZw
         9VNBfkUC3HkamN2NxO8D7QH/n0S2zwJ+EIvq3Pzs=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8150: add other QUP nodes and iommus
Message-ID: <20210408161953.26298-2-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the first and third qupv3 nodes used to hook
up peripherals on some devices, as well as the iommus properties for all
of them.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qco=
m/sm8150.dtsi
index e5bb17bc2f46..543417d74216 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -577,12 +577,26 @@ gcc: clock-controller@100000 {
 =09=09=09=09 <&sleep_clk>;
 =09=09};
=20
+=09=09qupv3_id_0: geniqup@8c0000 {
+=09=09=09compatible =3D "qcom,geni-se-qup";
+=09=09=09reg =3D <0x0 0x008c0000 0x0 0x6000>;
+=09=09=09clock-names =3D "m-ahb", "s-ahb";
+=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0xc3 0x0>;
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <2>;
+=09=09=09ranges;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09qupv3_id_1: geniqup@ac0000 {
 =09=09=09compatible =3D "qcom,geni-se-qup";
 =09=09=09reg =3D <0x0 0x00ac0000 0x0 0x6000>;
 =09=09=09clock-names =3D "m-ahb", "s-ahb";
 =09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
 =09=09=09=09 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x603 0x0>;
 =09=09=09#address-cells =3D <2>;
 =09=09=09#size-cells =3D <2>;
 =09=09=09ranges;
@@ -598,6 +612,20 @@ uart2: serial@a90000 {
 =09=09=09};
 =09=09};
=20
+=09=09qupv3_id_2: geniqup@cc0000 {
+=09=09=09compatible =3D "qcom,geni-se-qup";
+=09=09=09reg =3D <0x0 0x00cc0000 0x0 0x6000>;
+
+=09=09=09clock-names =3D "m-ahb", "s-ahb";
+=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
+=09=09=09iommus =3D <&apps_smmu 0x7a3 0x0>;
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <2>;
+=09=09=09ranges;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09config_noc: interconnect@1500000 {
 =09=09=09compatible =3D "qcom,sm8150-config-noc";
 =09=09=09reg =3D <0 0x01500000 0 0x7400>;
--=20
2.30.2


