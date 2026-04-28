Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFDD2E54AA
	for <phone-devel@vger.kernel.org>; Tue, 28 Apr 2026 03:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777348290; cv=none; b=KSAynd6Y9KxBHxkeC9R7+XOUmRUICN1wQuCcmeo7ZhanSU0Il6nQ+hOMUPjL5/rCfbkDIR4AIKCLTsL5+C9UYD8EtcEKG5mN53PGubQLSG4ngJSHbVb2oybU/YJwLiL89m74Ao9S4qyVuozZn8+AzvVap44FrOiGlyiPrmWo0Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777348290; c=relaxed/simple;
	bh=RQfjDmjDhFBZQeNCmuYx5MyE8j6k2g5d33MZmHmxCmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwFyspySj0J5AjOW04y2EY0+dKB8lWris9fp7NrHmhBXPJJMSy86YFibc0AJ2jgRY1/S/jU1LqfV0zT8dfIVZtETF5mNQe9lg3Q127axTuacZck4CWA3AOzCbyIpq+7/m0PV70j/efaDZrtoLFpw4o57lraKHuwYf2EnXIsGlLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=om7wcb+v; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="om7wcb+v"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8f15e900586so229408585a.1
        for <phone-devel@vger.kernel.org>; Mon, 27 Apr 2026 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777348288; x=1777953088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=om7wcb+v6jOtI69VUjVTFihCYGBnZ5on48uPRzAVMvPTaqFaNcbrLl/6MkV5QW+DcB
         kxPDH4bKZSsy5XmRm6RUPqu+fcooPzoHWEhtjRZAX44M6VDtYXsp9PJa0AlQ564ogkmu
         022TOCX/89rPiIRSdYugVcf4FDmF2hozU9ZqVhVnuTB2Ex2JO9VFPkiLEV1CkoV/C1F+
         CqvoYdDWOskf2ylBidvPs0a0KN4SQMrNQOTTlZ2uEPoEZNlvSQtV3HlOtYfy9h+v8X+9
         0xdTds4jnVnlRDkYlkB2JIi604qcnCLwU4hZMjyQ39PogIL4lNHuMGTgg5w+drVjz7kS
         RN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777348288; x=1777953088;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63f4GofBoWLfXQjvxrKaQNrlmvp+JGGyl1KjrPUdmXI=;
        b=kTZnDrleKR8gqoBV2ttKJEMfBDjVa8EEZbME0tM1tNzIEGGVYt8sqzdt7c4y6Nz/bL
         a9gxKeq/9TfAI/Py4kGItOPRh3Ik1Gvz+IJRwW+FtmqWZYvVYPP6pQrPFgZHBsaPxSaa
         8wqT6cL12lCBbvbMA7vNC2Fvr3Eg31Ca7iZmBijd0zgPAgdR6qW0XCndheZrsJXL4xHM
         kmpw2e1xs3YVdS/bYZeUSX++DFgkpaZneic86EMo5xiLazu4GAzF6RuJff7etCfEOULn
         QOYxnHOlKp0YkyervEbvhdr892IEgsZiAc8LXJDV7w0TtgWT8+AtdQMbad1d25mqjri2
         A5tw==
X-Forwarded-Encrypted: i=1; AFNElJ8UQ43q7eUgbJDkV+4vPt0TXuZsn55qyRrCa073s0dpBKXfGeS/wZdLwcPCVNZsEK7SaxIXqKLFTC7ZMw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ0WMVKdrNX60dUWcBw3uNXIB9YoWvg5BcS1bWieUAvbU/evha
	wOfUR48E3Oc6sLz4ND4JGyvrRhvB9GkZ5VxGmoHyPMudi5CxiSiW0QZY
X-Gm-Gg: AeBDievXwlEcaBa2twcMUwgsK0M/NjblOrO2a9kGYeYxreOJS6U7eFinyzKt07IdZtl
	0yW01WJAisvQwGvak+DSqTCXD/sHXdgG7egHTL4qpIAsuGA0p8pQdV7NB94aTpklWmawuWCCnGv
	CLD680gXDXwupd9UtYrpqOgKBYPM9V/LuxHyRgLWweTIAxkluqKLdR12uMEQIGOT5eEXljE1+Od
	tUJtMWlJszt6hVghrsmS1tLVWwkna+3EeNK1svz5wLVIKl3iMY+6uOVoaU7eimnHuKmoQVfR9Wz
	8ruAB/J/wuUSRxiIUnLoWioxjXt+7qmUGpsM92u29q3N7wW7NJwKB8hHg9lhNtL2HqtmBWjPZjR
	0LjopN+SKP1SyqJgTQ6pgPgH262doS8NIhLaAbSfxH9XzNIyOeickArSZNR7Y35iwCOL5s6Tnqa
	nXUGdg47yR74nZFysTFz87vW3Ulvdw/zCHH+Hz
X-Received: by 2002:a05:620a:29c1:b0:8f0:f1a5:680c with SMTP id af79cd13be357-8f7d9016b82mr191945585a.29.1777348288133;
        Mon, 27 Apr 2026 20:51:28 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c4dbcfbdsm100150285a.12.2026.04.27.20.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 20:51:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 23:52:10 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove
 clock-lanes requirement
Message-ID: <afAu6ueMsjBY-yUB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-2-mailingradian@gmail.com>
 <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4898366c-108d-479e-93cb-f79b27ba811f@linaro.org>

On Wed, Apr 01, 2026 at 12:22:34AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The clock-lanes property has no effect on the hardware configuration, as
> > of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
> > clock-lane property"). Since boards with new camss support can omit the
> > property, remove it from the required lists.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> 
> If you send another v10 of the series, please remove 'clock-lanes'
> property from the example as well.

I don't think I can send a new revision of this patch since it's already
applied, though there may be an opportunity if clock-lanes requirements
are removed in bulk.
