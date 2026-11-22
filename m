Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333963;
	b=YN65SQA/jKBfoNSbubdKSTIR503AKitmlpHMtCddUAsknVf7igF6yhxQST4gu9IiiuAT
	 7VOttzBBiQUZQBh2khljgVaRv0iU/PuCDR9HS9HjuYjVyjv5Fk6P2Sy6fcE6RtPTEPKP9
	 vZ9iyw+BFnsHpEP0KrGbMkALY3eCtttBrFu82aMmAckNxm4eNEM6njWSC+8ovyaSzOkbo
	 4WVJEnR1O+4b+JdhhqUJNrpENwIMYt4tMECMy10JhCHHNTyKVTnv4WDLSQXtCjquPkaBq
	 QOnKAWE9Z0Gwat3+pELX5mAhr7pD712hvfn4DHETPmLlDP8FMd8T4QFCAh2JQ16vF0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
	b=Gc25wJkEe38g2RkEimdZ+fKS4+BbNwLgQ/u6M047oQUGPhYljjZAy/1muOAxyhIe5Il/
	 ByD4WRC93Bc30RmuRAkNm2U467TaTVTd6HHA2qUAeiDdyibzTEM+q1m1w7MzcO/M+Z3iA
	 o8pVNtVsL6BKYwW+HA6Pl+8eEYeLw3IdllbvUbyGDpFABvh+UJQ7mkaStmPlWuKiW4lUD
	 Xedwy02Dp/3Prme/Pf4M1upvoO+kRZcV52DaB7k7dQ10C5WvQXZPgyU2Xs2w2hvwH0Ksm
	 T5U9vssBXIQZ+WUBXIV5YXZEv3Y+D+DDJslafqmDg6BAVhBq0aImjObkzsNBrRPWRkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD9B606A320
	for <phone-devel@vger.kernel.org>; Sun, 22 Nov 2026 07:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD9B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m8R5qLvJ
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so368845066b.3
        for <phone-devel@vger.kernel.org>; Sat, 21 Nov 2026 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795333962; x=1795938762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=m8R5qLvJwnBLK+o9R0WVEq95QI9gDJrbaGXirXaWjgk4/GwfdqjzJOUbw2A/aJFZDH
         sHkBM8RJm4FlA4mq9kajGiqRVsiRqDoFjmS7rEmqEENIJtcxvliptlDaZXv1RC6AWxDq
         /LHPjG2OYQWyFuBZFMwRwKgaVhmcchUxB3uEoXwETrwwWx9KADd3vye5nCQGEulHoFJo
         IOnjoXUqmaUCQYlFC2jEBkxI8pvNBV82OrjqjXTK1FlNY4Sc8ejvJFsVx5VzNNDuLd43
         NrkaIBNgvPF0MWyL1X31b+LM7u+BiRAYXcVmYMZXq1VVOJ+SZoQrTYFM3wsziKqSewTb
         rihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795333962; x=1795938762;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/xbKBOQ+2sn1cOusP4Ybo/C0ew1hnRxWONbAKH11Cm8=;
        b=revvd0pJr8toJ/hBMjeW2HmxLbkV44vJgiFoo8NCHXZAt0mhB5fER7aqJCczPRzZrc
         abu5i6MrgMNQy8cLX+r9ZoPfBbIEhyZSzSg382ydCipwh5M0vG0e4Ykwqh5P32kzMaYu
         AWW84ZVbllVK8CEclEfiACfaJOWSr34DJxJA+RK0ocr7sbVRSigBo2BTxxUmHIXzGTQn
         gz+MRiSZ9f+arsWo1MtXRSJitsEVfsPq8NbUPQ6IwaAincqnSEAONkp5+vhBVq34I60r
         tj71cHQ2tGju690cpgP0dcTE9MIaVp9Hwowg9CFKrbjwFwLuc3W9uTbftquy64nVbwGb
         0CZA==
X-Forwarded-Encrypted: i=1; AL+hErH9mZfJ1MgzZALLuO58VJseEkLQjIns3O/9qJ4/OZH8ADGHfWgAOUmbZt11c2jHNoDUM7PAGVxMblqqKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/vi5W+yuEvY+3RE5XnffGZSdvOx4rhimUQVOa/L9So4yAxItaS
	vib0wJcmJSGakAybaVxGVAzfBr5q64iqabcjGVC0Dwg/aEZQq0FBPS5l
X-Gm-Gg: AZFdTZc01TTwi9ezORfZ/oA+4284nxhbZOzoUwITp+OBhJoqQ1apmIzZrumIqLVGWAu
	Q/yeS0p0XYhJ2jj2VhMAvcLNGb1yEK/nlwffm0E86LgO9r6aGc9U0oozznR+af9olbiRKjutetK
	+v1vMVfZBgZu36Lz7Ep0+Dxvurc2pNP4tJc1PonyFdxIwjaw1qW4F9yDF3Jq8scuAWk/T8ZdSv7
	VMstzFOgjJEZTBydByvU5PGcAs8oaisAdHdjlRocEsOT86ZlrihIC13FiiKkt6ln9xheEmf9xhK
	pnZSkN7w9oYeCPUiwVNSoB4Gr+HCp66WuKCMWqbBZiE7vithekwHwhXmqNAaBKabkpCUdFXtRcC
	AlWjngmqq+f8xCUvHnV2PNumxacKVWQ268fhShRS4zDMxIvfGuekDHrhfqC9APUpcjwGvqGyQWO
	gcUJ823YLCIZ2Xv5nG8ZZt1FbZAQOXPgMrwz31fltxSaR8HWbE77lX+FeLHBhhD43N5xefjBNFv
	RSrjtnDdeubRQ8FMwjlqpcQz50VKM07sCA5IRmX7VqMXdBPBXxiT2Pkg2pMTFLXO4sEIaJrQTDI
	gMRF14dZb31xLJDQ06XLXe7ZgQ==
X-Received: by 2002:a17:906:2dd8:b0:c2e:3ed7:7db4 with SMTP id a640c23a62f3a-c513a840ebemr531051466b.23.1795333961712;
        Sat, 21 Nov 2026 23:52:41 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm290470366b.2.2026.11.21.23.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 23:52:39 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Michael McAllister <me@michaelmcallister.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: add Novatek NT36525
Date: Sun, 22 Nov 2026 10:52:35 +0300
Message-ID: <20261122075235.2915534-1-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-brave-adamant-caribou-b01daa@quoll>
References: <20261116070212.314228-1-tadilhusrev@gmail.com> <20261120114100.978148-1-tadilhusrev@gmail.com> <20261120114100.978148-2-tadilhusrev@gmail.com> <20261121-brave-adamant-caribou-b01daa@quoll>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 12:09:21PM +0100, Krzysztof Kozlowski wrote:
> Still incorrectly threaded.
>
> I asked to use b4 for a reason. If you insist on not to, then at least
> follow standard process and standard guides of upstreaming work.

Understood, and sorry. I was sending each new version with
--in-reply-to pointing at v1, which is exactly what buried it. The next
version will be prepared and sent with b4, as a new thread.

> > +      - enum:
> > +          - novatek,nt36525-xcover5
>
> I don't get it, what is xcover5? This claims it is Novatek device. Why
> isn't this actual panel manufacturer?

You're right, Novatek only makes the controller. Samsung's vendor
kernel names the panel vendor as CSOT ("CSO" in its panel table), but
it doesn't give a part number, and I haven't found one in any public
source. I'll try to read it off the panel itself. If that fails, what
name would you accept for a CSOT panel whose part number isn't known?

> I don't understand why this cannot be part of other bindings... looks
> exactly like nt36536 or nt36672a

Agreed, it's the same shape as novatek,nt36536.yaml (three supplies,
reset, backlight), which already carries a CSOT panel. Would you prefer
the NT36525 panel added to that file, as a second compatible item with
a novatek,nt36525 fallback, or a separate file modelled on it?

Michael McAllister (Cc'd) has a DJN NT36525B panel on the Moto G10 that
would use the same driver, so I'd like to get the structure right
before his panel is added too.

> > +  - port
>
> Drop port

Will do.

Thanks,
Adil
