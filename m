Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871CF242D60
	for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 01:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763601090; cv=none; b=Wm91l02VOFze2DpqCG96qXDVQZf8TBwX81UwR/mFWvRgfxrGu06LN8Ig3belUXPN0zTgXOb8OcYMX6cNWWotxxeWBI96GieV7sR3NCtIfUqsxZLJXyqyArPzw1ChlspHw3JCbkZTKscUqYzjh6flTwyidfi0h6fXywYNnq6L7/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763601090; c=relaxed/simple;
	bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhAqfCD3H8xBKYlQA9+/2G6zx7HRMjtj3UA2wh66yTA2lHlV7ztdyW0jAF/v8Z44dXwPhS/ld3NkRtzdku+W19dyzpB/rxtRjdBCAyxanw+S8n0pTcyR/gFid/jqNjKvCC8a6qZ7hbBGwLiEZqEtpNaTDHtLSCWo8QbF+ZpAt54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mLh2eKTl; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mLh2eKTl"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b71397df721so66683966b.1
        for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763601086; x=1764205886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
        b=mLh2eKTlu3k0oik+cic8c4gqT/M9C4CQpBMHpGtb5TijP1XPBqAJuQ7DwuCKhbic/e
         /MaAFDs/1F+2dJFvpRUDhlDp6BHmnbtj/AnCsSwp/XnzynFjgJJFlKeCxa30lIrYAjHb
         5IJCrWSL9aPXF3u19+HCx3eY7uhQF2UCpFIjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763601086; x=1764205886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HNKStvuc0XB3JshjhPWn5gZkIa6YpjmT/QSv6jmE+eg=;
        b=Mv80IiRD3v92oMcZOxMiReQ5FuLD9m9MFmBpUOs5lcmLTBP5/OqcUv/8iOAR7xMKhl
         Z51jfMUofI5odiqK77Wjh6+UmtUlmUMxV6n9w5D4in44PZHiPiOaDJCKpQ+pXa0xiz33
         CE98qUkeN6k8Rf6bMLrVnWVIjxtV3ufChocRnB0cPDH5d52mC1rh/shd2G6/4G4KSmst
         OP/6NtnqJP5vqZVMtpYad4chwnqYKMVeEVhAgRqfu6k7XkGAjBJ3FVR1ua/BSS3Fi8Fi
         RXWD/ZgGKopqj2yfHWiY9K1sZ2oaALnJkfuKNGfdZ2XR/q9Me46VJbKRaZmK3ZLpVwGc
         1FIg==
X-Forwarded-Encrypted: i=1; AJvYcCVpb8234MD3wB/xpKeH8ALB1CBKGVTu/G23N7JaOg98Ok07+G9youiNrEXAea8snkoS4AojXrH0+G1iMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4gA3utjpDSVYeaga2i5FaLAERFx1MrslBUo3xhP9RqCFArupN
	YE4vM3uEX3slnHx3E9+trTcH9WSOxZ4NLXeafkIKZMCXjkI/Y/9JYXMRRletsaPV6YJIzmiG7uh
	weFaBOLGq
X-Gm-Gg: ASbGncsw8s9a1c+1NBU7/qsD1mTTyfAQSvbu2k9AkoeFRVa5RAEQFUiFQ5SahRq87Id
	TAv7sNRN4jWEjaR0negz//5YD//r/aoRx7sob5gKEVtODR3aFYJfKmOjRMht8FvmdgrnJwDkBw7
	EaGb02HyBJSjTXv1MjOYxUzHLW2LZBxrCSIoS7+KYL30B2xGpS6YsazOoVJTCHhbegc0Z+C/XCA
	3ZK6jpMhcu4jpjAhCc5KBANQQpIEmND61baUT/SURvI9TQ2Qzw3V+mospT8AMEUg4aCWr2QToIV
	KnEHg8N6upH2Po+4il4KwZRRCQ7tecnTQJlAcimlFjGOYbjOUG49KsWde8CoF8Dz02Jp0b4ycH/
	BUZeJU6P/FXq/7iRdabOL2o+ca8skjvR/2sWxwIlnjr4XIexqrd3WbdXHrwSURrMwmsRxCVz4YB
	rGGf0n9HAE7UGTdIQ2w/5cjJ1wOeDv+QXEjvk/pPK9SPP7TdAN2qyqxmppZkVi4sHymLVYfhM=
X-Google-Smtp-Source: AGHT+IEsNa8HLOjSvcMPZRrgljKqHJbApNW0fpcJ4j4YcmSRbJVDOJmLjPIN5wFDOT27YNi+v6BKug==
X-Received: by 2002:a17:907:3da3:b0:b72:d117:1a29 with SMTP id a640c23a62f3a-b7654fe99abmr127052266b.51.1763601086408;
        Wed, 19 Nov 2025 17:11:26 -0800 (PST)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ff3c6asm74107866b.52.2025.11.19.17.11.26
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 17:11:26 -0800 (PST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b737502f77bso51897066b.2
        for <phone-devel@vger.kernel.org>; Wed, 19 Nov 2025 17:11:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqXUVcUE/GVEeNERgmISxf4p/n1R4mWZqNjht2wsuoMEc+adc4sge/0qGz0mBA/ulmhn5t1HdauoXYcg==@vger.kernel.org
X-Received: by 2002:a05:600c:3ba8:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-477b8d8eec1mr10748455e9.35.1763600661833; Wed, 19 Nov 2025
 17:04:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118-pixel-3-v3-0-317a2b400d8a@ixit.cz> <20251118-pixel-3-v3-8-317a2b400d8a@ixit.cz>
 <d81b0e70-5e3f-4e33-a268-e8b903904e9b@oss.qualcomm.com> <d9c91625-a829-474f-9fda-5e39342bb4af@ixit.cz>
 <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
In-Reply-To: <96673da0-d8be-4b82-9e8c-2263f752881c@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Nov 2025 17:04:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
X-Gm-Features: AWmQ_bmyj5sGx4tyY9L7h2oSdpAiPgC3_696WJh5bzTVt6VHuCNSI8LWrwUfgrE
Message-ID: <CAD=FV=VrB8FycxF+SFpP0-LBuRh00q6ecQ14fJj5fBKcFqsdCA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add support for Pixel 3 and
 Pixel 3 XL
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>, 
	Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Nov 18, 2025 at 5:41=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> > Yes, there is only one firmware, which crosshatch has different, but al=
l listed in the initial bringup are used for both.
> >
> > To add, crosshatch was somehow not that popular device, so as I've been=
 suggested in u-boot discussion, I would love to keep blueline everywhere.
> >
> > One exception is LineageOS kernels, where they go by name crosshatch, b=
ut again for the both phones.
>
> Google seems to suggest crosshatch is the 'base'
>
> https://android.googlesource.com/device/google/crosshatch/+/refs/heads/ma=
in
>
> Ultimately if none of the Googlers (hello +Doug) care that much, it's up
> to you to choose

I haven't dug into this patch series and don't personally know a lot
of the history of older Pixel code names before ~Pixel 6, but in
general I wouldn't expect Google to have much of an opinion about
Pixel 3 support upstream. I'd say leaving it up to the people doing
the work sounds good to me. :-)

-Doug
