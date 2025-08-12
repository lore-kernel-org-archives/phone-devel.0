Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E7C2ED86F
	for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012065; cv=none; b=hd5z26Ey6QbAxhFIsZBruIeYhneMKfpFHlgqeLL/x3aDYFx5VYCWxJANHYekENt+8EqdgM4W41rrdrRc5kw3qElpo2XctqmYGLfEXqztD8khViBLRCnisw4tsE9a2gaHnv5QdGMaEfb8BOcpr+DnWGomIFJvmfk1ui7H44qrd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012065; c=relaxed/simple;
	bh=QHHuJW/EiamKuHBNtdgrPVoL/XB/qHj8wnI2/U0ofGM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LG001brTBzXV73MC4b4qw6S98jQBde9H1gMO8pMiAqbO4hu7UTS+M/Vku2D2PlxwxtVk1USNFNJjH8fsvzEvMF2zUx5b64k1734pW3yZejnBWwpUAJUQkL3occjIa8HzUSRrkzw7ezjc3D1HX0aB3+OeaBMfD06MMk4E25aLiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Kx92KOQi; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Kx92KOQi"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-af949891d3aso733876166b.1
        for <phone-devel@vger.kernel.org>; Tue, 12 Aug 2025 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1755012062; x=1755616862; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cuCCH8VAlUam+cA47ykU/6jYW/fThVT5+TG1NG7tyQ=;
        b=Kx92KOQiTjcPZvbXOkNoFcoyc/RZ4hV53WytAL+F3IBvXRhfSJCvyP+4sNAOx5RhiL
         Qb+mKXqa8KtRUqL0jZX7zOL5ig7eigmWY6OxMicVhoGtmq8lG6wwREBqpTEIu267WL7V
         MWyRpDKgsYxqacDxGJRqKQp5/4p7p3sj0Fr+e8N5jqeNUcohEp5zw509/RL924NlEyYp
         p24XK8V5HOwgeIjsRQdUxXgThxa4jBdSInJJpj8xOZWr5vqokcARrP1ZZ+xjt9woUV1O
         fwkxnw22iVkBAlkB8xCxtPb8lpX9J6WMyOUbI69PzZ4mLZqYB8R0PrxW8IucfmVGIOF6
         jqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755012062; x=1755616862;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cuCCH8VAlUam+cA47ykU/6jYW/fThVT5+TG1NG7tyQ=;
        b=LUrO/OJ+Ej45kE03kO0pQ4d5zxebclSqYoZTOhIeTRhy44Bi9ANzhEk5Jca5cqzh27
         oQ/Wpw6YSjAAdbjc7pSZNd4aXZ5JadLE8aAEEm3X8UkfaeVfag22G/L4WOrRvjnkrRIG
         zMHxsVFNYHNZg10ur/6v27vFEciN5wHywBHZoBPe+a70yFuQ/dAn2YfhG9vuvVMErb0Y
         7Tpi4kofnyrem2zZoHg4+36EMq2oAUwYH+f/o2QjFRyh7FMifRo7+whpfauKT5c+jl2E
         xc9u5xuAyQL95ZNF0wDKFwJBstYkLBcBXNBhN3etgNdKvr+g7nC1CSzsEe+vn7TeI9oy
         +F+w==
X-Forwarded-Encrypted: i=1; AJvYcCW5rMkIyg/106cPun2qz8zzIKzgk0OijJPjQVS1IyVmDLloK/U9trFwQJ/kgaTKeotqP7+i6oDJdEiGgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVeIwqWI0pscM6ov/uqVn4lOuXip/nNpRIHbIBfMidIwOR/yW
	rXA6N+G5qc2cV2FkpSueFl/zgfdtctJDM0/9NYExJzahEgYp+T75hlnD8RhpDlfrUUU=
X-Gm-Gg: ASbGnctcCf3dfuQ5+bUEwNH8Z7WqSLxHXDJJIAe4Tsyiql4x5gjX1XglXWbKP0II6ww
	uySy7OTHJKiKYo99MFSJMMvVAavRFbOt9q2D/QAumY9/jksEFBpgHjdSsydLy+cx8IB8H/wbxuh
	kIEzqt0HzrNwyqaG+rUV7HXqJmQzx2r70KFwlLnCCTbnc/rOnLTQiiBJIW/BP1NUNotnFYHc+HX
	tOImzglt/9MpfJGLOgShCgMledaUfZlSVuvHz1wmUuiXT5sLR7yjEOUeeE0ycB42oiaPNFXazPO
	knXCR0vcPwvYPPJkjd095Tybn4DJ2FbmvNKvc9ThZbBTciGu5FTB0LobRkSESLjt7NsdnGUjRCr
	FfaP4CivEx/Bvj02U9djcLKNHt7jMjg==
X-Google-Smtp-Source: AGHT+IHi8A4KGcy8JJcWOFoy6dDibyPAXIGPczBPkGZjgn5/c5sakdzR7AlrO/zc+TLqsTti16DCqQ==
X-Received: by 2002:a17:907:1c1d:b0:aec:65d1:cc30 with SMTP id a640c23a62f3a-afca3a74174mr8586866b.44.1755012061884;
        Tue, 12 Aug 2025 08:21:01 -0700 (PDT)
Received: from localhost ([2a05:2d01:2025:1908:e499:6dcf:1e86:8748])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3b77sm2220245866b.51.2025.08.12.08.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 08:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 17:21:01 +0200
Message-Id: <DC0JUQMZN9X8.26G5HXLTC8YJZ@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>
Cc: "Konrad Dybcio" <konradybcio@kernel.org>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] soc: qcom: ubwc: Add missing UBWC config for SM7225
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250723-ubwc-sm7225-v1-1-d688caff70f1@fairphone.com>
 <blibzpqgbjbbwvnsx3cu3fzjxk776lamnmd4erokc5jx7qkubh@7da6ihmb6xxj>
 <xsrkh75xb6klntc4mc564iq4wipe6iaqjiugk2r743n2y2h5dt@s33t7fckn5gq>
 <55xazajnwigd744shnkk3acba7fozsaciybjexvrp2rdvs2bhm@35lglwjsazdf>
In-Reply-To: <55xazajnwigd744shnkk3acba7fozsaciybjexvrp2rdvs2bhm@35lglwjsazdf>

On Tue Aug 12, 2025 at 1:10 PM CEST, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 01:32:00PM -0500, Bjorn Andersson wrote:
>> On Wed, Jul 23, 2025 at 10:03:15PM +0300, Dmitry Baryshkov wrote:
>> > On Wed, Jul 23, 2025 at 04:19:22PM +0200, Luca Weiss wrote:
>> > > SM7225 is a variation of SM6350, and also needs an entry in the tabl=
e.
>> > >=20
>> > > Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
>> > > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> > > ---
>> > > Note, due to other bugs on next-20250723 I couldn't fully test that
>> > > DPU/GPU are working, but this seems to be required in any case...
>> > > ---
>> > >  drivers/soc/qcom/ubwc_config.c | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >=20
>> >=20
>> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> >=20
>>=20
>> @Dmitry will you pick this as well through your tree, so we avoid (the
>> trivial) conflict.
>
> Yes

Could you maybe amend this patch to also add sm7325?

Or check if any other compatibles were left out in ubwc_config.c which
are used upstream, I didn't check...

Regards
Luca

>
>>=20
>> Acked-by: Bjorn Andersson <andersson@kernel.org>
>>=20
>> Regards,
>> Bjorn
>>=20
>> >=20
>> > --=20
>> > With best wishes
>> > Dmitry

