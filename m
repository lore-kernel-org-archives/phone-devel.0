Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5777FCD4848
	for <phone-devel@archiver.kernel.org>; Fri, 22 Sep 2023 16:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbjIVQnT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 22 Sep 2023 12:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbjIVQnL (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 22 Sep 2023 12:43:11 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59D119E;
        Fri, 22 Sep 2023 09:43:03 -0700 (PDT)
Received: from g550jk.localnet (k10064.upc-k.chello.nl [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id A5267CFADA;
        Fri, 22 Sep 2023 16:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1695400981; bh=0b9u8zcILOem+66IO8g6cH96H5GxmSzUl5aFzzdzuW8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XrjPV40DalNTQrJ6fdCZWFTsRz5xOS/Oi9jYxZnQ7usBvRV24cXlwMyJUYiIOSqIi
         odsYwrrzlH3jVMP/5WtZqZTbzW1CBScU8jlzbn80F1xPr6S0/QB3c/3Ff1Ryd1vxhV
         WZAmh9bYYzYg2RAh8OoyZVwrne/5aCTaUeujWOIQ=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Matti =?ISO-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>
Subject: Re: [PATCH 2/2] ARM: qcom: msm8974: Add rpm-master-stats node
Date:   Fri, 22 Sep 2023 18:43:00 +0200
Message-ID: <4510576.LvFx2qVVIh@z3ntu.xyz>
In-Reply-To: <20230922003533.107835-3-matti.lehtimaki@gmail.com>
References: <20230922003533.107835-1-matti.lehtimaki@gmail.com>
 <20230922003533.107835-3-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Freitag, 22. September 2023 02:35:33 CEST Matti Lehtim=E4ki wrote:
> Add rpm-master-stats node for MSM8974 and the required RPM MSG RAM
> slices for memory access.
>=20
> Signed-off-by: Matti Lehtim=E4ki <matti.lehtimaki@gmail.com>

Like in the msm8226 patch, also here this appears to match msm8974-v2-pm.dt=
si=20
/ msm8974pro-pm.dtsi from msm-3.4 kernel.

Reviewed-by: Luca Weiss <luca@z3ntu.xyz>

> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 32 ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi index 706fef53767e..0bc2e66d15=
b1
> 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -116,6 +116,18 @@ pmu {
>  	rpm: remoteproc {
>  		compatible =3D "qcom,msm8974-rpm-proc", "qcom,rpm-proc";
>=20
> +		master-stats {
> +			compatible =3D "qcom,rpm-master-stats";
> +			qcom,rpm-msg-ram =3D <&apss_master_stats>,
> +					   <&mpss_master_stats>,
> +					   <&lpss_master_stats>,
> +					   <&pronto_master_stats>;
> +			qcom,master-names =3D "APSS",
> +					    "MPSS",
> +					    "LPSS",
> +					    "PRONTO";
> +		};
> +
>  		smd-edge {
>  			interrupts =3D <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>  			qcom,ipc =3D <&apcs 8 0>;
> @@ -1067,6 +1079,26 @@ gcc: clock-controller@fc400000 {
>  		rpm_msg_ram: sram@fc428000 {
>  			compatible =3D "qcom,rpm-msg-ram";
>  			reg =3D <0xfc428000 0x4000>;
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +			ranges =3D <0 0xfc428000 0x4000>;
> +
> +			apss_master_stats: sram@150 {
> +				reg =3D <0x150 0x14>;
> +			};
> +
> +			mpss_master_stats: sram@b50 {
> +				reg =3D <0xb50 0x14>;
> +			};
> +
> +			lpss_master_stats: sram@1550 {
> +				reg =3D <0x1550 0x14>;
> +			};
> +
> +			pronto_master_stats: sram@1f50 {
> +				reg =3D <0x1f50 0x14>;
> +			};
>  		};
>=20
>  		bimc: interconnect@fc380000 {




