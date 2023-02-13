Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D17AC636D4
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 14:43:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjBMOnT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 09:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBMOnS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 09:43:18 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270181ADD7
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:43:17 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hx15so32373860ejc.11
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 06:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pGNWzQsWQRWGTvnfJyE9dtNKkJQYQPujsNKK3+X+Dw=;
        b=vNXVDFdNb37h5sqewcx2RhMJQEAc7yvJW1GM+yCd1uRS/6zpdPrQpm1/akFe1T4776
         H8XlIj3Hcag1YHiorKjeBG/2c77dxIKbozyb3azPfQa/1uD4OBMy4CHnF0/kE1g7SRzM
         djKmN34y5EvpvLpyyUzGN7XoNq0JKmFM0p4RPQPlfBz2llUjt3zuJLjOeM1ot1T0hAKL
         G6koFvbVta5Wi5Q2V1nKCW2Jl9Ud50H685DIWKhKDdbzup2fF2sbDy/vwmpAjNUVVOYH
         btwaudrGSscjH1uh43M/TgTxZGqavxOlpl2uoJRvsHZ4bUFVkd0izKxGiiYjap3cdD11
         P6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8pGNWzQsWQRWGTvnfJyE9dtNKkJQYQPujsNKK3+X+Dw=;
        b=U7KDPd5MKZykFYDgfZNU5Q7mv/f4mPO5UMQ9Idbo2xkGd5PIGttpuyXQCgiNJgvEsV
         4lp+yCoMLqe4+4s5tvrP1UsaWOxiEW5xA3UGdPkNMUMXtw6XL9xGPo/9Z6M5jI0WsgHj
         lbdDDxNwHwvAolNlwdcUY8hzRNgXyO/iZbGjceGj1oLVoRdsnGtOdWoo4WI81pfGb9YQ
         ASCEGdiz7gBAUrOvFA8cJvk1+jFvComynxRN7nI3xZYl/kzQKsNbMlKdUasxPigy8WBz
         Yt9KH2KfS5ixxWq/K1L7klrYkZR+c3MWsBmVmNvoK4gxWJ2EfM0Uce8Ovf+l78ukUT/z
         aUSQ==
X-Gm-Message-State: AO0yUKV4fcjbRu0fybmb2wS/+OgQJgoomM+bcRiQSAzbj2iVFjb/tzJw
        LE5TmWdIq7CTNXuF2AHfjfsH8g==
X-Google-Smtp-Source: AK7set/AwyLn1pV2b9VsqDjTEXW/eABrhwQuorsTJaEenVhjsZ1lKcK4ILpF1Cn0wzy2Zyju1MM2YQ==
X-Received: by 2002:a17:906:7f98:b0:884:3174:119d with SMTP id f24-20020a1709067f9800b008843174119dmr28191309ejr.14.1676299395722;
        Mon, 13 Feb 2023 06:43:15 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906179500b0088a9e083318sm6845357eje.168.2023.02.13.06.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 06:43:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 13 Feb 2023 15:43:15 +0100
Message-Id: <CQHIJJ1Z0E52.2QKE1LOH0D497@otso>
To:     "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm7225-fairphone-fp4: enable
 remaining i2c busses
From:   "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.14.0
References: <20230213-fp4-more-i2c-v1-0-5be09dbb5ce6@fairphone.com>
 <20230213-fp4-more-i2c-v1-2-5be09dbb5ce6@fairphone.com>
 <f25f9854-8faf-7469-19bd-5ff998cdb97d@linaro.org>
In-Reply-To: <f25f9854-8faf-7469-19bd-5ff998cdb97d@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon Feb 13, 2023 at 3:40 PM CET, Konrad Dybcio wrote:
>
>
> On 13.02.2023 14:26, Luca Weiss wrote:
> > Enable all i2c busses where something is connected on this phone. Add
> > comments as placeholders for which components are still missing.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Any reason you've not enabled GPI DMA yet?

Good call, I enabled it in a different commit that isn't meant for
upstream, thought it was already enabled in mainline.

Will send a v2 with this added:

+&gpi_dma0 {
+	status =3D "okay";
+};
+
+&gpi_dma1 {
+	status =3D "okay";
+};

>
> Konrad
> >  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 25 +++++++++++++++=
++++++++
> >  1 file changed, 25 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/a=
rm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> > index 86114dd2c0c4..d0f08b42592f 100644
> > --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> > @@ -359,10 +359,31 @@ &cdsp {
> >  	status =3D "okay";
> >  };
> > =20
> > +&i2c0 {
> > +	clock-frequency =3D <400000>;
> > +	status =3D "okay";
> > +
> > +	/* ST21NFCD NFC @ 8 */
> > +	/* VL53L3 ToF @ 29 */
> > +	/* AW88264A amplifier @ 34 */
> > +	/* AW88264A amplifier @ 35 */
> > +};
> > +
> > +&i2c8 {
> > +	clock-frequency =3D <400000>;
> > +	status =3D "okay";
> > +
> > +	/* HX83112A touchscreen @ 48 */
> > +};
> > +
> >  &i2c10 {
> >  	clock-frequency =3D <400000>;
> >  	status =3D "okay";
> > =20
> > +	/* PM8008 PMIC @ 8 and 9 */
> > +	/* PX8618 @ 26 */
> > +	/* SMB1395 PMIC @ 34 */
> > +
> >  	haptics@5a {
> >  		compatible =3D "awinic,aw8695";
> >  		reg =3D <0x5a>;
> > @@ -495,6 +516,10 @@ adc-chan@644 {
> >  	};
> >  };
> > =20
> > +&qupv3_id_0 {
> > +	status =3D "okay";
> > +};
> > +
> >  &qupv3_id_1 {
> >  	status =3D "okay";
> >  };
> >=20

