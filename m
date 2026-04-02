Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F3241C8C
	for <phone-devel@vger.kernel.org>; Thu,  2 Apr 2026 01:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775091934; cv=none; b=pryKEOvII9YfG6EvhVmtEWGCpBoO92nw7rooNaEeBZTbN+P2EPUWrh2oSQr7muzAFUUnzJkhT0FooZiR+HVd88pW6JNZkUi3vNeGeJSwiizKxbCdb9w+2c7FBMjgj+2dizIq2eIKa4sU1YFoJTwASDeYHUnhDyl/5QefS5FIuWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775091934; c=relaxed/simple;
	bh=am/OmExRMs6+4inYpMeuvlbO5iWLZZ1oD5RIyvgeXuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWqyGy1vZwGrtYRgGIDqdBoDBr0yNkxKjWUlJbooKdOkSr6q+hk2phbMaAQGcRz+rPizvkeHVktlkEGbJ8bShVzcLsPqY8kJj/gDzVhwD9++76gO3eXGYfpV5+KOqUJvEvhuAKRdTGy3IfjgJ5XD9aLOOtWy7owjVXeoVK5A9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6siG1Eh; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6siG1Eh"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-506aa68065eso3108081cf.1
        for <phone-devel@vger.kernel.org>; Wed, 01 Apr 2026 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775091932; x=1775696732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=E6siG1EhVTKGOfnj4xwH3D/Rw5dWilZ0kNDXadAQBVOQJzl0vx/FVmSwewipWFENKA
         xo+ztQgylWLADpS4vH9Sb8hs2mvQzuSgoIQtOLg/AeV5KTNrNMU+rU/FQrTuCd8ZDjQB
         E/YSSTSELWrLmk7pJdEebIIUA7v8Y0UYXgHR/YsLTN6kVqxJI1S4jXaAB77nvwWOh1IZ
         LFrMJJuYXZU/QqOITLSChuO3mUAzyGXkidhWBNNs2aa52sGILDCdSVMcOAffOMFgyBNY
         JFWcq3yG/mNyNgr8VYcsoFVS1cGo69MTJucRPgN3xo/CfYHa++nejqkjf0tLK/ZirJs1
         gt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775091932; x=1775696732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/gHu0FdfX6ZXbcJGvtqN+jQ/yvbzkeHZ4ajTT5rTrk=;
        b=Z3G2sMDIpRS41qImMWEVkwHKdLOmnra0R3jTKOhGAYiIoRmYXBWk63Mnsb0SfOMRfd
         OgvVGGMEzNDkKmFiTY6livDFGI3+JK3gpAjnInHQM/xN4nNXvahqwzfJKP0HhZftE7et
         YqiWmO7fpQ2fAjrXs2iIqllKmdTklPPnqwX0r3YntBF/37QiBKSfLLLpyALbfM2XCO3Y
         2P4CDdng9Gk7LShNVg7gk9hycfeefXOn/JFQpiUwNFSTZ0uMab+sekTRQLbr9ln5He23
         SLaqRJpFK2hXhQyXKUfkwLH9jI6lk0BesNVnu05dIqUHNZe6KoBTz0uC0XOMhsS9Bs84
         Aftg==
X-Forwarded-Encrypted: i=1; AJvYcCUWr3/RozMyKJ5n3HED8mJxNlwcnz3ZSacL6AMfnZ5Ji8X4pkuIVRgYBSon04ny+1Y94+Pc3XCUUnJx2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxwWToo82G0FXW4u6ZqzfiY4mW3WRAZ4BY9ShOhsxVssPEaZ4CL
	TusnxzrlwDRhSKffAuEMW/h0Zs4q3Pv8qOhWolxU16o6gvexn0As1g1Y
X-Gm-Gg: ATEYQzzzf/cef1MjRYMYiHhCLpsDStRElO6+3yy8d1MHFJPjeNQ8keej2Prh6QWuEBT
	5s0QYry9BXDbsjP9hXkpKEpNFxl99j5Kl3RXASv3PrDDljsBcOuUd3ue3ZuDVxkOf6yTKr9AtGL
	yxRaOVA4tZ3kB17Er3bYMHanw9iEtZNzpoiNfn2m4FPktzGqrrLKlFNSyIQ/sT8vHJccgXNnZL7
	sRW5LA9ZBxxsyaPs5CXmlmANU/Exoh/nNPCUwjnIMo7t+AERRw93UX/r1ZPCA01r6PdEX4yllVL
	eUz5t8Og8+kjxUpf69EDOze+fVpGNJ6RaR7lX1J4U02NGtZbVmLEuk4shaqlZ8o9P/aBH7A6jrW
	7cmeeKnwUT8hj0BmgMJlUSmzxm2KKtUJ7H1LGazXUKRGEhvzGfV1Wt2DJVm2xuJPd9Y5FJV6Vkn
	CbG5nDYO0lFLlNJ/quLfWVbcgBog==
X-Received: by 2002:a05:622a:d3:b0:509:2455:2b53 with SMTP id d75a77b69052e-50d3bdcc8cdmr85646001cf.49.1775091932321;
        Wed, 01 Apr 2026 18:05:32 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b1a3fc7sm14217521cf.5.2026.04.01.18.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:05:30 -0700 (PDT)
Date: Wed, 1 Apr 2026 21:06:06 -0400
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
Subject: Re: [PATCH v9 4/7] media: i2c: imx355: Restrict data lanes to 4
Message-ID: <ac3A_m4sKyJHa_hT@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-5-mailingradian@gmail.com>
 <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c51f9fe-9c5f-47dd-a971-5b2a9e416230@linaro.org>

On Wed, Apr 01, 2026 at 12:37:14AM +0300, Vladimir Zapolskiy wrote:
> On 2/17/26 02:27, Richard Acayan wrote:
> > The IMX355 sensor driver currently supports having 4 data lanes. There
> > can't be more or less, so check if the firmware specifies 4 lanes.

This patch is superseded:

v10: https://lore.kernel.org/all/20260311020328.57976-1-mailingradian@gmail.com/
v11: https://lore.kernel.org/all/20260324020132.8683-5-mailingradian@gmail.com/

If my workflow somehow caused you not to receive the new versions,
please let me know.

> Does IMX355 sensor hardware support any other number of lanes?

Actually, I don't have hardware docs so I don't know. There can't be
more or less without driver support.

> 1) If no, then it makes no practical sense to check for data lanes number
> given by firmware, there can be any stored value, but it's known that the
> number of sensor data lanes is 4.
> 
> 2) If yes, then please return to the sensor dt bindings, and reflect any
> other options, right now it is set strictly to 4 lanes only.

I think more lane configurations in dt-bindings can be added as they are
discovered, either by reading hardware docs or by finding a board that
has a different number of lanes.

> In case if
> 'data-lanes' property is omitted, you can use 4 lanes as a default number
> of data lanes, and this information shall be documented in the dt bindings.

Later revisions of the patch require data-lanes.
