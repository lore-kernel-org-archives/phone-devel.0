Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C495FC49361
	for <phone-devel@archiver.kernel.org>; Fri, 18 Jun 2021 17:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B03156100A
	for <phone-devel@archiver.kernel.org>; Fri, 18 Jun 2021 17:51:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhFRRxq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Jun 2021 13:53:46 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:42369 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234614AbhFRRxq (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Jun 2021 13:53:46 -0400
Date:   Fri, 18 Jun 2021 17:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1624038691;
        bh=onAKe/biroI41LpAe7sVhylTtE4hGOfcVD1JV5mJa74=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=SRm9mZT8oVoF2BrDgA8WcpbDHA1+ByBk8Kzsl4MEPGIH2Yhf5/DEryHInoX0JuyjO
         ayLtXCeFIXhsKaNezQkMiNapLXtDxigPx8oVFTH/zZvXyjvRRk64gLev5qAeXdWFcg
         Y4t4WnfVTvUZ2Zab/PD087MEZbaK6LRgpKKLKLEA=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [RESEND PATCH v2 3/6] arm64: dts: qcom: pmi8998: introduce spmi haptics
Message-ID: <20210618175041.323495-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add bindings for Qualcomm SPMI haptics on platforms using pmi8998.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/pmi8998.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qc=
om/pmi8998.dtsi
index d230c510d4b7..5412cb3af0ae 100644
--- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/input/qcom,spmi-haptics.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>

@@ -41,5 +42,20 @@ lab: lab {
 =09=09=09=09interrupt-names =3D "sc-err", "ocp";
 =09=09=09};
 =09=09};
+
+=09=09pmi8998_haptics: haptics@c000 {
+=09=09=09compatible =3D "qcom,pmi8998-haptics", "qcom,spmi-haptics";
+=09=09=09reg =3D <0xc000>;
+
+=09=09=09interrupts =3D <0x3 0xc0 0x0 IRQ_TYPE_EDGE_BOTH>,
+=09=09=09=09     <0x3 0xc0 0x1 IRQ_TYPE_EDGE_BOTH>;
+=09=09=09interrupt-names =3D "short", "play";
+
+=09=09=09qcom,wave-shape =3D <HAP_WAVE_SINE>;
+=09=09=09qcom,play-mode =3D <HAP_PLAY_BUFFER>;
+=09=09=09qcom,brake-pattern =3D <0x3 0x3 0x2 0x1>;
+
+=09=09=09status =3D "disabled";
+=09=09};
 =09};
 };
--
2.31.1


