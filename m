Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A760DC48BE8
	for <phone-devel@archiver.kernel.org>; Fri, 18 Jun 2021 17:52:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F4F56100A
	for <phone-devel@archiver.kernel.org>; Fri, 18 Jun 2021 17:52:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhFRRyh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 18 Jun 2021 13:54:37 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:40050 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhFRRyh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 18 Jun 2021 13:54:37 -0400
Date:   Fri, 18 Jun 2021 17:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1624038715;
        bh=ulNHof10tUKifws+o9+Pfwn+8c/swxx+m9+KaSPVwhQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=DALkSL00qVrgrcx0BtxPsdz3x59IOZHmUClSShPf/E3MiNEUYwqVqRv6ha1XFgWkH
         6UdCUvk9J1qA9qrcPu4aEJlenv8Rl0BTujwQwlrAXSivIuJD2izatZ7H51UqlEcWed
         2Q0GMHNAjoGB3sOogNuC93MHe6LnshY8uGvwomjA=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jami.kettunen@somainline.org,
        jo@jsfamily.in, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [RESEND PATCH v2 5/6] arm64: dts: qcom: sdm845-xiaomi-beryllium: add haptics
Message-ID: <20210618175041.323495-6-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Joel Selvaraj <jo@jsfamily.in>

Enable the pmi8998 SPMI haptics driver and configure the play rate for the
hardware.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/ar=
m64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
index 7d029425336e..07a91e3cd662 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
@@ -311,6 +311,11 @@ resin {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+=09qcom,wave-play-rate-us =3D <4878>;
+};
+
 &qupv3_id_0 {
 =09status =3D "okay";
 };
--
2.31.1


