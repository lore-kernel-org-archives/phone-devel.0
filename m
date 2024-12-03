Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FE9199247
	for <phone-devel@vger.kernel.org>; Tue,  3 Dec 2024 07:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212384; cv=none; b=Nex2KdSEVZaI2vNoZtAsh2s+ti3db2UMEUF0kVpQIktblqT2izyJ8e1yIPS8lhWfTfT55ldYqxm0zx323Ulwd9Pk6AVUyrMVd35U8Oa/k6TUKdl8AUwk4Zq43kZLKAL33GsgIW5k6VvGO7wLEfkIimg0OPc/imxsLUd9+aFNxQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212384; c=relaxed/simple;
	bh=7rsJx8PPlBUPhNYZpY4C2T1GcmfaUB0tv/4wQt6eSwQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fFZJ9Wgz6xudbHXBKDY2cCU3R7rRl/eG3OHN6Z4y58b5JfaLzYT9CjKYx9MXIL1REZa8FU4Au64aYaxzkhHQPUUOY6xeGTfIzAO8ulCTtdK1oVewz5eZpwTyrwM5pknXZX4VfjMyUEfXCJe5PPMESvF4ISn+au5LM56b7PTmD5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5mreDrvi; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5mreDrvi"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa55da18f89so784201466b.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Dec 2024 23:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1733212380; x=1733817180; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D7zw9MHhki0fQyrcbsaXtFGQSkwrEFiOvoXEAaY/xE=;
        b=5mreDrvisXdmU0+p8DFDxeGIiyupLJoDkLv8XDdd/CHi1lEy02hanxmk6zWLfyowjR
         NgwFRMJhnZUkHQCmbdMAwZ9oaIgmrnI6bHF0UbKkxXXBX4idrgEOQxE1V7WsnQjPqMcK
         LWB5Wn4HAXF6vAVBCGDeMMrC9xLJbivTWv/Vw68v3bxumnEP+D8B9s4De3u46ttvBdI1
         R/5OB80A02susf0LbhHs3YlOcHElYWGW5LRqF5prvB0ohAq1rcZKHjqZQ1o6qS8bvAfB
         uW/d6CyPf2N+HUBOkMofkRBU6pBkKW7m9DyGXnH3xkl5iBb9v2C9eUBTS0B9samKgHCW
         /EwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733212380; x=1733817180;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0D7zw9MHhki0fQyrcbsaXtFGQSkwrEFiOvoXEAaY/xE=;
        b=njVRYIodLSV66zVd4iNVVeNoruj2N0yDSA8kEvZl7bRroTLInqcrR8LF/PTOb5hhRP
         CDN3Og9fcQpdKTJ1mJWMn25x3v9ZXQBmhcRiMy9eLNibiXlvFQDb8x57jSHQzAsn6++H
         wXUR3jqTX7/4KD4yhTcEDJuBM2Gt99Kmn2uWQhe4ABP415pTtlOSczOTsuDsruAxUuGd
         0NIB1ATsH0iVZAHR3hjqS5RFdz0ePmC0s7H/xfh9SVQAgxKOBWsZl2Nau6Fp7MXL7L3n
         DHRyh85ZTbw+YYF/PA3hJmU/kZ5MF2AkUfguwG2/61gPRsCZ7mzpvm3gPfdK9mF8JT6h
         g8xg==
X-Forwarded-Encrypted: i=1; AJvYcCWYoY6ywAZiYyhGo5LBKMNA1ylOfQCylkWSNSsaFHUba4NruK9POOp9ol2kh7ov3Agd0dd4s8sf2XgMEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaKLmzGDZmnK8fRP0C8GN5o3kqM5CkK4Ay9lnmqVk37gA/or6S
	v6qmrblkuTFnRJhdkHckyF+a4p9GuNXr/rPWyccoE3xTgRkUhXutZKOJL0jucHg=
X-Gm-Gg: ASbGnctKbfNENzYlDX1gF7Ujf0xsfxSCJr02XFXwoqzi6KJb6XFvb1+Ky/CRw8hxO/b
	JIxqRVBneWQWZ3DiiOTXy8tcebTBgwS6Dy0Dgge3aDMFbZw0BSiQFbqqwHHV35ESxMH7be2+7Ng
	8tBoiUUJ8K/2Fr5JzkEra98KvEnrcnVa4PnVKtppXNZUKVQJQKzMqxqVMWqp8aysP9/dweRHHGm
	bP4fAMQldZa5AXCGMMnLfG+R+VO44DQ+Q6YzPow37BfAU/LU8d/0e/M0sKktvW8WProRDqVv1ss
	ektxKAAWjt1gw/UdBgs=
X-Google-Smtp-Source: AGHT+IH5Y4Euy0lKtptex0iUPrTdDlymLHlyKHDlm+teFEcJLphIHtL9LraZ6mJjjupisyuttL8ryg==
X-Received: by 2002:a17:906:1db2:b0:aa5:152c:1995 with SMTP id a640c23a62f3a-aa5f7eefc47mr81228366b.45.1733212380291;
        Mon, 02 Dec 2024 23:53:00 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e771csm591681166b.127.2024.12.02.23.52.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 23:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Dec 2024 08:52:59 +0100
Message-Id: <D61WIF2XWKL8.MWU6PK2XGX4F@fairphone.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: power: rpmpd: Fix comment for SM6375
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241202-rpmpd-sm6375-v1-1-12a4f0182133@fairphone.com>
 <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>
In-Reply-To: <yo5cc3cvvwwdrqrrgwlquztj52sijip3ffyyqag55jrnztxi2m@hn75ylkhnxie>

On Mon Dec 2, 2024 at 9:00 PM CET, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 04:45:02PM +0100, Luca Weiss wrote:
> > During an earlier commit, the comment from SM6350 was copied without
> > modifying. Adjust the comment to reflect the defines.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> Fixes tag, please.

I thought for just a comment fix it's not necessary / desired.

Anyways:

Fixes: 2d48e6ea3080 ("dt-bindings: power: rpmpd: Add SM6375 power domains")


>
> > ---
> >  include/dt-bindings/power/qcom-rpmpd.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindin=
gs/power/qcom-rpmpd.h
> > index df599bf462207267a412eac8e01634189a696a59..d9b7bac309537cbfd2488e7=
d4fe21d195c919ef5 100644
> > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > @@ -65,7 +65,7 @@
> >  #define SM6350_MSS	4
> >  #define SM6350_MX	5
> > =20
> > -/* SM6350 Power Domain Indexes */
> > +/* SM6375 Power Domain Indexes */
> >  #define SM6375_VDDCX		0
> >  #define SM6375_VDDCX_AO	1
> >  #define SM6375_VDDCX_VFL	2
> >=20
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241202-rpmpd-sm6375-06582e126d7f
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
> >=20

