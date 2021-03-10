Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38976C43333
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 16:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FA0E64FBB
	for <phone-devel@archiver.kernel.org>; Wed, 10 Mar 2021 16:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhCJQbp (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 10 Mar 2021 11:31:45 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:15268 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhCJQbe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 10 Mar 2021 11:31:34 -0500
Date:   Wed, 10 Mar 2021 16:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1615393892;
        bh=T/uujJvcIAww74op8dtevNJmAnCZhQyRCNeuhVJ5+y8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=og6Zc3DZGoxdH1E4dmX8lHPV0NSAStHJB+6L1FR9iHEx5Ty5911pZTEAPSZyzn7PY
         gyQ1NgQzbr+MrSXAtrlbKfS8bbdc+J3ney40k/X58NWj4N+A/yEyz2ZG4M70nIQ9ok
         rlE247/m51PRI+T9mzw+BmvkXGu33OEf16Ijn8F4=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 1/3] arm64: dts: qcom: sm8150: add other QUP nodes
Message-ID: <20210310163024.393578-2-caleb@connolly.tech>
In-Reply-To: <20210310163024.393578-1-caleb@connolly.tech>
References: <20210310163024.393578-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the first and third qupv3 nodes used to hook
up peripherals on some devices.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qco=
m/sm8150.dtsi
index e5bb17bc2f46..03e05d98daf2 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -577,6 +577,18 @@ gcc: clock-controller@100000 {
 =09=09=09=09 <&sleep_clk>;
 =09=09};
=20
+=09=09qupv3_id_0: geniqup@8c0000 {
+=09=09=09compatible =3D "qcom,geni-se-qup";
+=09=09=09reg =3D <0x0 0x008c0000 0x0 0x6000>;
+=09=09=09clock-names =3D "m-ahb", "s-ahb";
+=09=09=09clocks =3D <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+=09=09=09=09 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <2>;
+=09=09=09ranges;
+=09=09=09status =3D "disabled";
+=09=09};
+
 =09=09qupv3_id_1: geniqup@ac0000 {
 =09=09=09compatible =3D "qcom,geni-se-qup";
 =09=09=09reg =3D <0x0 0x00ac0000 0x0 0x6000>;
@@ -598,6 +610,19 @@ uart2: serial@a90000 {
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
2.29.2


