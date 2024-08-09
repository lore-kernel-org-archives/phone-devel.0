Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE6190667
	for <phone-devel@vger.kernel.org>; Fri,  9 Aug 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723194760; cv=none; b=JX9rcFJW+sGV9HAG6+9NPF3evdrpeSU9z3bmsLPis4YHDwiLp12q6UfN8rwwO6yL/ykB3lTEen9vCvWTrQn0qgCEokyKHsLGGk9vdCq/XOecHUsakwri7qE7PIXWBd7KMiikw5xrX9xT5MrzmLqp5RUyba2617sCg6sYFoAyWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723194760; c=relaxed/simple;
	bh=iLzGfAYReosnIhXCk1VOcUKl/i0/LVKCJemQ52zsYcY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=cN2d6pMT9gxKoeceqW6od1cTACfSaVIaVIjATJ2h7ttuSl771IrPw/8ZycGsFvZwX6vTADErQVlchCRCnkJq7DWUhZA9OCMmLA1MzcjHMBDlXE6Q7OZMH1fPlHfEnGRmebE//vPga/mH3Doe2SDIq7oGC/rRhtdWuWuxW+Ebyh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=TTD+G6Sg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="TTD+G6Sg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5b8c2a61386so2407673a12.2
        for <phone-devel@vger.kernel.org>; Fri, 09 Aug 2024 02:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1723194757; x=1723799557; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=TTD+G6Sg3RkVbYTiP0xWzcz2Umah3VWczSIWqQrpWtNGpvN4Q42O1oVtNdE0DBoEIV
         WE5eMozONdAzBkHVl+DXF6agpKGNuX6CyTKhEcWsqenYUAEj+3RQxY3yIaeGuLu9NBjK
         d4IKcB5k+FIKEEN1CJxrR/iovo8J4+3BMmB/q43tjPl+D1iye4ub1B+fU1Q+dwtUfdbw
         G5L2GwsXPNBHfN/DO7IOX2wZCE3BXr9qsWgmJ40hIKr6G5rGTACyb6TRBGmV38cLfI6H
         mNUHnbWtLLU6XIAhQowqM26wNjY8TZelBdS/MO0DVjwXhROSYjc0Rri3VA7L1vjGg3Fd
         qBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723194757; x=1723799557;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/g1EWdSRyPvJJ8eyFtdobneAEkMnKZn9VHRowDdqkMs=;
        b=O165kgvdKvcVw9TWfzGDYD16JnHeGVpV60/6aAfDnjPYH4IJkk99Ht/eDL2UlpXitz
         Cl+LUf9bgDscJLnIJtPUdxJBT663PvwuGiVcRozdiM3IpEPJ6oRZrX/EiN3UE8S7RxRu
         bIzm4zGFSSTuJqp1zNUwbe3UyUI0m2aLoUWXWrxkt+JulLV9bbSaCnfVV6bV4Ln8uhjC
         EfzQCtIwT/2vlxNy72cIyLRUuEOd/9fxck50oTNFNw1MUp/hUSc6XsWYtOwnX8WK+TXr
         RHprDp04nalsb6W0WIcvgO9uvv5ftKLsGOAQ+dt6UQkJCB2f9gE4TaeBW9y+6ul1k+aM
         rT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8aIkYKw5/uJlUUVvkFFZbBcyPvyD7PKLR8sRp1MfUqO9lgpJZrVOAPexx6rCd2WGFQY0uKPQHRCf5993iLm5FGG7qZhYKaWZbkn0=
X-Gm-Message-State: AOJu0Yy3jbUaKT0HS0Dw94xiPJN6GDQPPojTtruuQPmdNmDQ51gTVwi2
	VMRMnogiFQBGUMyTjCuOouoCE3GBssl667URsBzKt3SgJAvqZFFSxMwwDalzjLc=
X-Google-Smtp-Source: AGHT+IHDUZDs7bOcbUASgJVPa4IcEoa+TGubCNTDd+aHDQmy+MvrocMHlvfzwk/Wi4ksiDbfFd9BVQ==
X-Received: by 2002:a05:6402:42c6:b0:5a2:ec88:de7a with SMTP id 4fb4d7f45d1cf-5bd0a6dc52cmr695902a12.33.1723194756675;
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2c4b5f2sm1358221a12.45.2024.08.09.02.12.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 02:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Aug 2024 11:12:35 +0200
Message-Id: <D3B9K69AAWNT.2KIHAZRFNB8NP@fairphone.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: qcom,sm8250: Add generic QCM6490
 sound card
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Srinivas Kandagatla"
 <srinivas.kandagatla@linaro.org>, "Banajit Goswami" <bgoswami@quicinc.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20240809-fp5-dp-sound-v1-0-d7ba2c24f6b9@fairphone.com>
 <20240809-fp5-dp-sound-v1-1-d7ba2c24f6b9@fairphone.com>
 <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>
In-Reply-To: <e8a24709-de96-4d09-ba00-1e084a656c68@kernel.org>

On Fri Aug 9, 2024 at 11:09 AM CEST, Krzysztof Kozlowski wrote:
> On 09/08/2024 10:33, Luca Weiss wrote:
> > Document the bindings for the Qualcomm QCM6490 sound card.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b=
/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > index c9076dcd44c1..0a31be6d917f 100644
> > --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> > @@ -31,6 +31,7 @@ properties:
> >            - qcom,apq8096-sndcard
> >            - qcom,msm8916-qdsp6-sndcard
> >            - qcom,qcm6490-idp-sndcard
> > +          - qcom,qcm6490-sndcard
>
> I think it would be better to make it a board-compatible and also
> followed by qcom,qcm6490-idp-sndcard fallback, thus no need for driver
> changes.

Hi Krzysztof,

So that we get "fairphone,fp5-sndcard", "qcom,qcm6490-idp-sndcard"?

I can change it to that in v2.

Regards
Luca

>
> Best regards,
> Krzysztof

