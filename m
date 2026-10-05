Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720244F54C
	for <phone-devel@vger.kernel.org>; Mon,  5 Oct 2026 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791192964; cv=none; b=V/ryID8nrMJhf4CpIxDisN01Mas9tI+WxfRHT1VwUTYTB3WAZkKFCjO9BYxVF5fBbMoNRIDgJnOzQW3S/6GHv4Qgg+ekck97pd7YGIs5zNrG65jdtbphbfSD79lf9c+WIWHJKT5VxR5hewmS9L0zg3E/pbasM9CnGKoYGzGRUkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791192964; c=relaxed/simple;
	bh=THNiZhFHii+ex+LZMsS2OghfP24T0+GzzryhIM5GK6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Pm7oSvseF2l+Qjp2M3++2fZvcPaGaiqrpRoIYFbz+nEEVY1VlmEZo8PqRV5Zmv00JpTZ0beFt/Gbqfjbek9SKRHJGz9wF2DE8bAf2sf9F7ub9kj4QDLgsmraqjI0t/fnFIxEfi3SS91+OnFxH/52+heG6/uRMU9V/lYIk8QZrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IP3UlyLd; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IP3UlyLd"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1626d6a6cso9108305e9.0
        for <phone-devel@vger.kernel.org>; Mon, 05 Oct 2026 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791192957; x=1791797757; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=glJhOe3o69hGuf36JpkU5EUJfHjbvLOwKHaTPoIM6ys=;
        b=IP3UlyLdDl7MF5rFNGopn+P5YwigWgC7jWPj3foZuJas+AtlDLV5/+p0tCRHUe4HhM
         fqDSvUgHPXM6PrGF6HnU8QeydZTrfUOSX3aW2iV1ZR8VILbe5tPMioFTeLkM+1NB2XM8
         ucd6d+w2eDHwgiaLo/OYR0uMVB3BDzKxGCG7miHoH2ECdZe/wydFKLlAVEePF+rWHQRB
         gzw0DQhCpEaQOQHHbAI0Z16CH69DgKKgPlvMEvXRSsA2cOyRHXmbMzpbaI2/UYPzpOGS
         /WVL+qCN386ZR8Yh2n/+xdaFxtZHKi225d+SpujkweEIJGq/6QrfsG+iJiCyF4tbO67r
         a0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791192957; x=1791797757;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=glJhOe3o69hGuf36JpkU5EUJfHjbvLOwKHaTPoIM6ys=;
        b=NykZqgVnPAsGGUeIjSMs/ypVt6teG64yDYf1NEWvh6JwJjuKDJWKvI0Q+AIkW5AT7E
         /McX6JoYCe5LvriwDJ99EJNr5LjY3f+Ojk+2jDxnf8w6sD2Z/3BsypNr9jlDkE1KTTVI
         0jaY9oZY4IInMyeSrTnUGqy6UKjDq2EftlWIce2M2h1SpkfC6NGY+kNYDchoHCBfe8/U
         SLCB2CpLui3TqEnuEA/B2eXAeF3totl7iBmX79CHhsk1c2y6KM9XCANeFUqN4y4/mBS6
         AsyGvAu3V6YPfbSA8ex8lSfafIVv6SQPIvUwtzn7QbOlZvzRSdcn6vHIfsxuXWLQcGmi
         2Vdw==
X-Forwarded-Encrypted: i=1; AKwUvBxJ/W7T1MIAizBSh295iYuOFKlBJP5JGzJJ9e+BcskJrMcaEzJoPf821MZP0EI5CvEE8TlZLJmBYximiQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mTMie+d9CHKXzhSC9HBJXbu7t7OKx/nB5wqeq76OoNVh3q+wAI
	fedUFDAXjid/lkl+zvqwsGwwjtQsfqSGEFvvRK0lr1SBQ5ybhNzQGzLIMPhhq6lek7I=
X-Gm-Gg: AYBFou3AbXVU7a1g53XzuauskmswXh39W0nK+R5L8Z8EvuvOAM+cFWGfI2AnD0k/ntT
	zln7tEbnBn3UFkspDhOBILu7x31hjmCNRIZ8yJrKABOg16uKxu4uVtNERSPPVkbTJrzoG10LdvA
	Z0j+lRPm0u0QiDHANCce5SXO9Y0c7VWG9vtjB7W9sw5iiRfzrnjionW2B/GfIToj7mioJoS5p4g
	eIsaqF6Zn4ShK7Xt4/5opelqne2XE8KEGcFesKFf3DW5oqPmmwDLwOyhBeXm8CeH7G1ppYduEmz
	08QAZ+ybEoOTpATjnxvkQDWfjpEb25aAjTeRG8a2juHvj8zeE+nZ5Rfjiyy66K/GHSRxmaWQlMx
	xKU3CRTrMPa/ccoBFoP26HgKjhzKdWAsqiVQ8DU3EarLeH/PFzxrX2l9WALlQANO+IzXPEHOg6G
	sVYGv++MC+yJdQIHfWKx6I2JTP9nyTt6D3e2no9oq3scq7aStsY6SRim+3C6Oqrckg+qDr
X-Received: by 2002:a05:600c:4705:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-4a1680ffb88mr111842255e9.25.1791192957347;
        Mon, 05 Oct 2026 02:35:57 -0700 (PDT)
Received: from localhost ([41.66.99.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm313414045e9.1.2026.10.05.02.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 02:35:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Oct 2026 11:35:54 +0200
Message-Id: <DLWSWRKGNB1K.303TRIRF4FH16@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a:
 Tighten compatible matching
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Neil Armstrong" <neil.armstrong@linaro.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com> <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com> <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>
In-Reply-To: <9be89803-974c-4746-8af0-a13e5a19fb33@linaro.org>

On Mon Oct 5, 2026 at 11:27 AM CEST, Neil Armstrong wrote:
> Hi,
>
> On 10/2/26 16:49, Luca Weiss wrote:
>> The compatible was defined too wide, we just want "djn,9a-3r063-1102b"
>> and nothing else.
>
> Can you add Fixes tags ?

Sure, I can do that. Wasn't sure if that's a thing on dt-bindings
patches, but it seems to be used regularly.

Fixes: 3b59787a5170 ("dt-bindings: display: panel: Add Himax HX83112A")

Regards
Luca

>
> Thanks,
> Neil
>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>   Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | =
3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx831=
12a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.y=
aml
>> index 2c60d0cd704e..3dd9b25ff13f 100644
>> --- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yam=
l
>> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yam=
l
>> @@ -18,8 +18,7 @@ allOf:
>>  =20
>>   properties:
>>     compatible:
>> -    contains:
>> -      const: djn,9a-3r063-1102b
>> +    const: djn,9a-3r063-1102b
>>  =20
>>     reg:
>>       maxItems: 1
>>=20


