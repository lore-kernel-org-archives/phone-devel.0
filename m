Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41163C433F5
	for <phone-devel@archiver.kernel.org>; Fri, 10 Dec 2021 02:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhLJCbF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Dec 2021 21:31:05 -0500
Received: from mail-4317.proton.ch ([185.70.43.17]:15411 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236009AbhLJCbE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Dec 2021 21:31:04 -0500
Date:   Fri, 10 Dec 2021 02:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1639103248;
        bh=orN9o2yFBpTAIH2g0jhG95WDC4zcISQzngnP5iyclQ4=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc;
        b=lle55ijyb3iu7Cf5akyOTE9MPdQ6bSKapH2aYCWuB/hkdllVMLI09repBXSVqHbdm
         VLrFUFtC6nbipjG8+PMMOYtLonPHtbyqWIZBEK24hpZUxOHU/LcVGpjQOwrcUpoz8b
         PDM86DwK/+twnUQLCi0EbK9cpLvJCqqt85hiQsGw=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Jami Kettunen <jami.kettunen@somainline.org>,
        Joel Selvaraj <jo@jsfamily.in>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v4 6/6] arm64: dts: qcom: msm8998-oneplus-common: Enable PMI8998 haptics
Message-ID: <20211210022639.2779173-7-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Jami Kettunen <jami.kettunen@somainline.org>

The OnePlus 5 and 5T both have a haptics engine connected to PMI8998.

Signed-off-by: Jami Kettunen <jami.kettunen@somainline.org>
Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/ar=
m64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 654188027f79..0f9ad775392a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -257,6 +257,12 @@ pinconf {
 =09};
 };

+&pmi8998_haptics {
+=09status =3D "okay";
+
+=09qcom,wave-play-rate-us =3D <4255>;
+};
+
 &qusb2phy {
 =09status =3D "okay";

--
2.34.1


