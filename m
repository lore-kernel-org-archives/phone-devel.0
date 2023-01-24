Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45F1C54E94
	for <phone-devel@archiver.kernel.org>; Tue, 24 Jan 2023 14:48:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235013AbjAXOso (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234994AbjAXOsh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 24 Jan 2023 09:48:37 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00ECB303E7
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 06:48:34 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id u19so39601634ejm.8
        for <phone-devel@vger.kernel.org>; Tue, 24 Jan 2023 06:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zLmM/FCAEjLU2FdJ9A80pZJUuYCaWow19JPmu2luiqc=;
        b=A1Q9UxdZZRYEsGB1//OQ5e21lf6Jd3C7Xgykqn+gE4C9RdaeoSzkZZhsE459oSrhZz
         qe/DdeXCjiCUASPkO9FM7DnXQJTEvFg6bJP9sacrYBSol2CuxQ3zHTG/ufUR2iIQGHRu
         kdk+eBPCfP0qvY7J9DDNabUaimGEFGZ0EQ4iO2gDHawsp/8bEtglFtSB4hi+mne4oCT/
         wXr7BnpDogZ4GkECKHeukLdKFMVDiBd7kpDq5BkTAR6sd4q5R9P1oKtEPqsneGXpla2G
         wy3XeQpl9XGmQ/SOGXZ/46qZ61tMTBwDz9LJW3rGA85pMCx8H4iK0q31XSxIJuiUwX4h
         27wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zLmM/FCAEjLU2FdJ9A80pZJUuYCaWow19JPmu2luiqc=;
        b=oY36AEnOAuwLuUOYh6RnuHAZhPssuW1e0+baY4vi43ViOXN2cdD+Vp2vj3Nc6e/lVH
         aq/N2S6pESbuXTGRUkii13CXKI8ak5gcyF4mdf6iN5sXBUmhCLTZTt5IXMg5SPRaAhVw
         CxAcDnFoSwXkuh7ZKynJHLLK0R/NkXTwGOMRj0jHgBRZCt4wzhuU5prFNjfEqWbUB6Zd
         fN+kb6WgxfgZCQWlAZwdxC0162TKEJpYT7zFomw/VDOnnYhXLTtSHWlVkXOhJBpR4PIw
         BP8Yl7Jz0ki7yAm125a83uZc3A63QDbA9smRMXMXf+MonnuwSZMcpfNalddr+h0FIW9a
         2IYQ==
X-Gm-Message-State: AFqh2kpDhiGnptejHGkKwEjW0dAkpRaO6lbQvaoo1h2fj+ScEWoeV+wB
        322TfKr2H0IBRVAWyXQr8X7UJg==
X-Google-Smtp-Source: AMrXdXsVvOMxuAPW5wRe6WtIgVighYVElOSLGxSpWFMYJgSUBYhgStGKmiPWAaWfnFO+qMDlKvfAaA==
X-Received: by 2002:a17:907:2982:b0:7c1:23f2:c052 with SMTP id eu2-20020a170907298200b007c123f2c052mr20541935ejc.45.1674571713476;
        Tue, 24 Jan 2023 06:48:33 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l12-20020a170906078c00b0079800b8173asm983498ejc.158.2023.01.24.06.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:48:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Tue, 24 Jan 2023 15:48:32 +0100
Message-Id: <CQ0I4ONEI6J4.3KWS1KBE7RTKD@otso>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm6350: Add camera clock
 controller
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Loic Poulain" <loic.poulain@linaro.org>,
        "Robert Foss" <rfoss@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20221213-sm6350-cci-v2-0-15c2c14c34bb@fairphone.com>
 <20221213-sm6350-cci-v2-2-15c2c14c34bb@fairphone.com>
 <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
In-Reply-To: <e5ff49d4-45c7-8c4a-d624-d8f7cc9ce2cb@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri Jan 20, 2023 at 5:49 PM CET, Bryan O'Donoghue wrote:
> On 20/01/2023 13:13, Luca Weiss wrote:
> > +		camcc: clock-controller@ad00000 {
> > +			compatible =3D "qcom,sm6350-camcc";
> > +			reg =3D <0 0x0ad00000 0 0x16000>;
> > +			clocks =3D <&rpmhcc RPMH_CXO_CLK>;
> > +			#clock-cells =3D <1>;
> > +			#reset-cells =3D <1>;
> > +			#power-domain-cells =3D <1>;
> > +		};
>
> Should you include
>
> required-opps =3D <&rpmhpd_opp_low_svs>;
>
> ?

I don't know, it works without. But doesn't this property not just
affect power-domains? I haven't passed any here.

>
> ---
> bod

