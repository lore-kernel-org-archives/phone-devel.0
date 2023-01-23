Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3ADC05027
	for <phone-devel@archiver.kernel.org>; Mon, 23 Jan 2023 13:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbjAWNbc (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 23 Jan 2023 08:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbjAWNbb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 23 Jan 2023 08:31:31 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67C6A244A4
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 05:31:15 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v5so14577304edc.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Jan 2023 05:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkjxihmP/RRWK9VQjwwJeH+rgfGTtQy2RZ4I1GLbrDU=;
        b=vHSNQV/7Cvxi6YzE+tqk87TGmEcBMgLct+Terv07pZF3n71NZN6mToSwaUAOYpTCga
         pJy06uVoXqTFZnC/6UBpYWDt9F2xS20jLL1/fbBNf6PvUiIa2G48SkTlJ2oUujdd19i6
         Bo6JAlZGxR92dinRojnEsD+8GSYo4FavkzLX/6x5a0RDgRy4e3BSoUn7F7iRbceS1dG9
         t8M54LxReo40rfyoDI+fYKvpZ5adpC84aEbwymRhUVehut/facqPw2EMMGQqR6UTAe5N
         2CCp0FIMYeVV25x2LKKoSid3BCYLbNMk5fi4mpN+j+FtXoV6aKoyL2FVOF2rc7YE0cFn
         em4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GkjxihmP/RRWK9VQjwwJeH+rgfGTtQy2RZ4I1GLbrDU=;
        b=K+GApsF6OuD6cipS3Ly66c3SH6A0rv5yw0XYl+dRcHgMsXp7h7CxbgKwVtWdEwWcE/
         iJAt6WJtomGDHpapl62kDAplXhyslnoXwOEfQY8suWiiqZ9uX5HrnL/10Pm8zYnn5zEn
         002jAK8pCTzA6PqZ6VEy4g3xWghsljTQxrrcXx/42ml1IigSz4Xmn7CDjRCyuR58ukpQ
         yphQBuiaJFR0Xzml5KB2DKBwR0IvI2Muwr0sWzHhS2HWyGHLY85f98rHpg4nmuZtQqdm
         DzPqw4IyI75V1AxQl3RYddosgtZmamilRmgXYlf6AvGuK4qG+ZGAQqRPtTz18t9WUlGD
         IgWw==
X-Gm-Message-State: AFqh2koO1J+XnuSV1wnedI+8oqDUqf/lIHHkM5HVezrEUfUwXLnec3Wy
        fRx7usvt9uEure2j5PSvVf3dLw==
X-Google-Smtp-Source: AMrXdXs57UGIVOWJpcsAwWfrPzF3LhZYGwEOq+MGAQpt7mZGi71TkrneWPjA9V5dUxH1xnOKP3ESHw==
X-Received: by 2002:a05:6402:2315:b0:49e:6a70:d9a6 with SMTP id l21-20020a056402231500b0049e6a70d9a6mr15642326eda.25.1674480673013;
        Mon, 23 Jan 2023 05:31:13 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906311200b0084b89c66eb5sm22003696ejx.4.2023.01.23.05.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 05:31:12 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 23 Jan 2023 14:31:11 +0100
Message-Id: <CPZLUWRUS9F0.1JP84TJFB2SPQ@otso>
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Johan Hovold" <johan@kernel.org>
Cc:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
        "Vinod Koul" <vkoul@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
 <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
 <CPR2LS3SJQ3I.Z7UY505COG3@otso>
 <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
 <CPX2VVT5EUDV.2LH6VI2586F02@otso> <Y85WqDrGXAXp7gS/@hovoldconsulting.com>
 <a18359f8-6495-dbea-2323-8ab73bbfc472@linaro.org>
 <CPZJ4F39LES0.ANG4EP8EUFI7@otso> <Y853iEBf1e7uh/wX@hovoldconsulting.com>
In-Reply-To: <Y853iEBf1e7uh/wX@hovoldconsulting.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon Jan 23, 2023 at 1:03 PM CET, Johan Hovold wrote:
> On Mon, Jan 23, 2023 at 12:22:32PM +0100, Luca Weiss wrote:
> > On Mon Jan 23, 2023 at 12:15 PM CET, Dmitry Baryshkov wrote:
>
> > > There are two SERDES regions. One used by USB part of the PHY (at=20
> > > 0x1000) and another SERDES region used for DP (at 0x2000). As Johan=
=20
> > > described below, vendor kernel handles the DP regions in the DP drive=
r.=20
> > > Possibly this caused a confusion on your side.
> >=20
> > Ack, I think I got it now. I also see the registers used downstream
> > now, e.g.:
> >=20
> > techpack/display/pll/dp_pll_10nm_util.c:#define QSERDES_COM_LOCK_CMP2_M=
ODE0             0x009C
> >=20
> > So now .dp_serdes should be 0x2000. Do I need to change anything else
> > also? I think not?
>
> You also need to add new dp_tx/rx pointers to the offset struct and use
> those in favour of the current ones if set. I think we hashed that bit
> out in one of the previous versions of this patch.

Thanks for the persistent help, I've sent out v4 now, I hope that's good
now and we can get this into v6.3 :)

>
> Johan

