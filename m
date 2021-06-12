Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B6F1C48BE8
	for <phone-devel@archiver.kernel.org>; Sat, 12 Jun 2021 20:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECCEF61186
	for <phone-devel@archiver.kernel.org>; Sat, 12 Jun 2021 20:55:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhFLU5P (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 12 Jun 2021 16:57:15 -0400
Received: from mail-40131.protonmail.ch ([185.70.40.131]:49056 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhFLU5P (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 12 Jun 2021 16:57:15 -0400
Date:   Sat, 12 Jun 2021 20:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1623531313;
        bh=puLXJ4n083iJD3qDod7BfN5xz30VVQhbboLf6Tp5nzo=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=hg2M6/UxMiGseyPXABHG0Gcej1ahGGoKSZZSvSx4JvExBQ87xh9FL3a/+uvkRJrpw
         emKBYW3MgB1MDgkxbIg9vKLAEq7lOQsW2Y/+ZdnIht4iCtMxT8Q+0krdjBT8Snt/4Y
         izyWKGJzRjuD2lx6ir76zh6L9v8Z9w3IkGgjTdaU=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/4] arm64: dts: qcom: sdm845-oneplus-common: add haptics
Message-ID: <20210612205405.1233588-5-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable the qpnp haptics driver and configure the play rate for the
hardware.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm=
64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8f617f7b6d34..d614bfae5c6d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -423,6 +423,11 @@ pinconf {
 =09};
 };

+&qpnp_haptics {
+=09status =3D "okay";
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qupv3_id_1 {
 =09status =3D "okay";
 };
--
2.31.1


