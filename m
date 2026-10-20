Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792524404;
	b=koJlYt5TLWyJs3Zci7NMiJjJBet7ACBr+UK3bMImcfldNKSRqzBvW7jcWLHZD+zEK1BV
	 0SgSGKGpZzoUSD8NmK31N5Jh8TOEZFnqDuT32+c1gvskkRSnN8yHWKZF3/aeXbVaoVUf1
	 IqMl8LX0Q8yl+1RF/SFc8KZEYV63G0OpHklfxhTwgJMDA+iZdayLe7MeyUieTOW7anu0i
	 c//ps40pyQHBzdBzvhxyvmviA5XcsiBzycSnO0ytfqKMFHnuzRNExDIW7YyD9J+9Za38f
	 1NYQ8DH95qRecOfl7ksD/ZGByGJdqYOyiccOvw/jUx95d//px3JfcPN0c0p5QwybwWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792524404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
	b=reYNPg04JRnVljgHWSnEatGV+ykjARdPJh6VtuM4KPgN6c3+dpgoc78yOHdfdCmw8OOz
	 E86Ant/dJrMbBALIXOUGJQDywocI7i+CWA3y96EIJnjnA4JtepTLN4AeeGfaO07t1+2w3
	 yf8hewPrkLEhNWCOYv4HOBpSLMLggvzPFVhNoloQWJVlLD7ObIXHVQEryChzmxLJoz/ns
	 kJQx9ogRnKKko1ovKHghebIim310C1WtCwVh4u/s4iAB2TwDkwzjYs4Nu3Wbxa7MkfmLx
	 1OjiQ2t0qTBwkholinz/4GMioa39ELus86jwRg/xQiAZgU173yH45V+eDPASG4uPqOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Jl3W+NiV;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71830606A31A
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 19:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71830606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=Jl3W+NiV
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso30574415e9.3
        for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792524402; x=1793129202; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=Jl3W+NiVjzOLdc1yjvnMCh9KK49lWbGu6oFGzqG7xriQpMgUNfgDnSELLjjnSsld+Q
         2nr2+cxfgJdMkbp1xdfIDSUoNLkZFWsVkf9QmImgUZuCfto2aPOm3W+w6HldIJjHopuS
         kJHW0wzuahUKrihedWLGnL/YeixpC19vTRpVes7GFZO7yP9/Y1EaUK0NnJuWBkeXgUTu
         qhyEaCyP+UTryz51Af2O+HRdCKl6ZP2e6HzN00CnWbUJToTzorJGY8BDwh6X8Ewx0Xsd
         +9fcrNUTZxOxQSjihUYqcWPrYO5+Vwhx8L9WNh4eqevucoJ2I/14iEPBdVP7ywLdTPP0
         8nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792524402; x=1793129202;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cqAn1cvZfqce28oUYl/gZogIs+MYV7l073QLWo7Q88=;
        b=l8riSjYBS2XlPjd+90Axlnp4KoJ5uvEOnwxzlGRyXsrrV8Vzinbf8vqvHb2PXnj3eZ
         RwwXTLpf9inwdynGjVcJbYoO43fDTCxL0u0vOI1oHt5bktJ/JAne66NAwH8/84GkN3WF
         aN7g5IYLwcnh/+IiZO2gSRjOrJmSnmxMSMHLLiLMlo+wHYC1Mlvk/iLFoy2lb5xYC+7L
         0hVbRZR/aD4QVWDLjfZC7kVdXqh68UVXN5xUwqI84ztIIr9kZH2HmltFkb7DXAk0By4f
         Kb20mQes6vCSDCaNYypwqyiHJMcTYdATYXc4/X8XAWVPFriGMlHhdd4l4IGNJMDE0ljn
         5CEg==
X-Forwarded-Encrypted: i=1; AKwUvBxqzH0cL1fO7BSLv3iqlhZWwk+e4HATDSGb4AmbyE/Fo/zIuv4WXGfuw0ziGmiaQYpT6XAZJS/E8qKcBA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLtVExEUPUIR27UI6AaNQ3DI/QT76IBjd8chPXO8d68HvtSvhcR
	u7mT8KJUi4zSQOb2wRNEiRN8oqveokSNef7t7XkjzYSd4St4EVZYeYFjuWjV9sY3VEE=
X-Gm-Gg: AYBFou0yECpJyvWs2/2JCcNt1qBG22QS54sAzt5mXmRwDzAoZ6JngFk2GI9EQwFYR8u
	6Qd/KHgszAA2un9oElQdTDI2+Yc3LKF/Aw6vD/7ZaSfIGikO2fjZjUDt4CuWAaR/S14X6b8QSVI
	Tk9J0ttU7XulSV5n5QaU0IwZSdPg2j0VzLusaQ8YbPJ20JhD1R6Pw2kHhCSA8NBokTSzV71sfTa
	HuBhPmiY2ySxvOGGw9al5VBS6hPewIA+zhRMEMeX138Wu6ucxAFKElVIVcZnp32gO9O6SHrClY/
	+ocA2X5FDPykAP3YxIOj9qOrsCvUbaLWrYDwmNkIylRjqdT7W3fUnZP5jqo3qeYY+iEWPDjthqn
	SJT9Y1oMT73P1qSdUC7Z9uEYlC8QxrQ0Le7K6O4+87VRByJ+3ZAdPJJqDlqGRQR5GFHBdMep85e
	XR1kjtHTMXF37ih3TMbnFofAuiwzFVxYFpjeq1noQbuyxr4KI/MXr2xd03XeMg0bDUkrz+6lmD6
	eOAPDv8hnG5Nx6n5OhA4A==
X-Received: by 2002:a05:600c:c119:b0:4a1:dbdc:b2f1 with SMTP id 5b1f17b1804b1-4a1dbdcb405mr180375035e9.14.1792524401827;
        Tue, 20 Oct 2026 12:26:41 -0700 (PDT)
Received: from localhost ([103.239.146.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm846135c88.5.2026.10.20.12.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:26:40 -0700 (PDT)
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 00:56:30 +0530
Message-Id: <DM9WV4TQ3JAM.2KC03GKSF297S@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Douglas Anderson" <dianders@chromium.org>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Jessica Zhang"
 <jesszhan0024@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, <cros-qcom-dts-watchers@chromium.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>, "Jasper
 Korten" <jja2000@gmail.com>, "Federico Amedeo Izzo" <federico@izzo.pro>,
 "Luca Weiss" <luca@lucaweiss.eu>, "Hans de Goede"
 <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>
In-Reply-To: <720ed230-4284-49c6-9332-e29f23765944@oss.qualcomm.com>

On Tue Oct 20, 2026 at 1:03 PM IST, Konrad Dybcio wrote:
> On 10/13/26 12:17 PM, Luca Weiss wrote:
>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>> From: Jasper Korten <jja2000@gmail.com>
>
> [...]
>
>>> Drop the output-low, the consumers already take care of the state
>>=20
>> For both enable and pwm?
>
> Yeah

That seems to work totally fine. Will include those changes in v2 then.

Regards
Luca

>
> Konrad


