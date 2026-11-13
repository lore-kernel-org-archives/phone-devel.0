Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531547;
	b=btt1i7vqUm4dLLHcB/c2NIIyv3JzKagVdhixuH7MDjTmslHNr6ZNonly8HCyitySOUFG
	 kCT1AproqrT+yBXtyf9Es3miDJKPGW6dDlJIxgoVWiQ4BgLj2/2IVodeEGvP55YXpf0NO
	 VJPxHBv5KO3LEakzRsLCE6p6dqbi9Y+9pOE0+2s3XOuDFJES4IB0ShFFrP+tBo9ud//Cz
	 /rn/YF6z9QuimyRXo4ek3JxbcEVbowfqZmPaEY4RXFA6CVIeYv6s9f9+V2SnHpeaIbTjr
	 am+c0bPRLAeQr5muZNAwNmAuLA0tI5D6rHFq1v7HvUB6U3Dq93e1W2iZSVH+L7hf7jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
	b=O7IXejJ9rvWb6yrWhu7iD73SXpyiSvURJ++cyFA65p4PiRKqdJZb6ZI0lUMnfBexUF8F
	 sA5EYjwPg2Gro+Vo2C2+VrheJBKKbKHH4Qk9B9X7bBFFh6mU0Hj2diudc+b+bz5/myH7R
	 fkRvAHlq21dSjurNsD1Xt3H2BD1TMtHKy9+Dax4k+gDp/i+t8KaU8m3qoyzpgkQd0Dykr
	 M6CHWaP/ZfIC+fLtyaPJyZ89tRNWXoF93GZ6yMJAJ1le1DhgglKrIMuvoAmDLTSL+Ifb7
	 I8reQzkTdSxn3gWehrGcNICBdm4XsXHoQv6IHQImphrtG/JlUhTnoA2egMMj5DIvOWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C79606A332
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 00:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C79606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aXwA6C2X
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a2af4c8d00so38760c88.0
        for <phone-devel@vger.kernel.org>; Thu, 12 Nov 2026 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794531546; x=1795136346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=aXwA6C2X78/aErlxdCDVlDcBhkVNyzQp81N3HP+FcVhJ/FM8Ts6K3OTLEdrDTNlTZC
         PZlGbsKqFdepUhhUwf0PTM4/12NFZOmop3SMoBLlrEo2OKDYLM2AQ+eqSG4n7pA3N1pj
         r5tFkM5LxFCtgMVGCSfAjr7e5Ubz2hvSMv3cYF2jhO92/gHpAxYLlGhuvE8Oam0NBvBW
         3d/2C//L92CiXCNnqw6r0R+4t9XZfGZjwz1VoaqfrCxDktj2prFI3iKcjRF+UXFn16ap
         6K7zLI1kvvv7cxwwJV6+lExKlmTZf4DnCTPEVPaKT1VACLFTNEai51iOa/kMF+qrecyi
         rbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794531546; x=1795136346;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnHQLMcLsmKQJDyIGTt0mvQnh81+ZXOZVkzwKRQPLt0=;
        b=2OCbYKJEU60d4R5Q4FuG7Pyouymoif7hE1ONuScBL954YJRLYbNJI84m4y5gHZSn0g
         kABYyt7f7rq7meCKdXMhZWUQNAjazw/5qsLb2jLxOtRJorxHnTDU6kD/TZgYsl2bDG+J
         k0thHm1d4eCeLp9XUrbmdjPHLYyAitu5mZBrdTY4EOTcNYzgmIk6npwOQRP1RKCMIrgM
         XTATl3o5ufcBPdQuW5b8sGdHpAWM9YgTV0YQn0LCMdzpObzuLJSnQf02HBC7QcG89Q0d
         t14LjLpmAMWK9imcs1hONKFLrHXEIk5Lw0iFLGdI9FmVEugvP25GShO/7lPVDyGBVbJr
         UdiA==
X-Forwarded-Encrypted: i=1; AL+hErGrRCPLisR5fchddT0Z3CwpGkPZClX8dt8oOjl+DZm9CO9uUcgEfRCcz+++b4Y2J+CosAHxFQ918S4qvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+E487Xi+fYjsOp9A0STQeSBMLd04KXmKOBXC5/DpIk8lPDQbI3
	Z7GC9Tcdzv4/i71vC9HtNDLgZNcOwMC1sktao++tDuy3F9Y/VvjxB/Qc
X-Gm-Gg: AYBFou3m8fJgAF8iRFFhUcEtmgTNsPovSJyqTDmwp/jIzuRg7/yggH4kZckjpR7iZr9
	PhtqWvg5xi4INmeV3JAyr5ETlF4jnDUvsItqt1FPrGKH/EtIJlhHZS0Fs7owh8Ui/E6H9r9akr4
	JQR5PiYh+6h5C3FRRaHu+zh2SkGTGIER/XZmx2S8DszOFmmqMw8J2kEUelxvVc14K+71YamxG/X
	hh7+JpyiQo+ZuMuZLpC6MkfyVH0LNL5K6v55XSLLzOn+AO2NBhRjs3w+8qhZJzjqPgTvHsT4+JI
	EPDzVsOP26ov8//HFbaV9ugfqI6lKLzCIHvOsXQ7vFczbkfFhicQmJBiJmNtb1yFI1gmn8CdlpL
	nijkoRL/DHql1jmU7ieVvBDo3GYqBl6bn93Vl5TnJRn8JtcGMc1tRVbJh3BkZhDmPhKMm2HXP4U
	JQE0QxZq/G38qNU9XK1bmu6SEf/fvJITjjQWW3aZRSgO73RU6Za3J6JhCLpa22pXUXi6VhbuuZC
	kDtG0NNw5BJMaC95KJdBP7KEoTRyf1/UZ5Tz1gpURQwJyUHAc0VvyeOTKrc22YnEn7YDz1ZiWFv
	jCaFF+cw3CSglQo6cZs2oXHlOjorGH/AP2WYSc1ODC5boq5jnE85vB2MM4OhN44UQkxna0w=
X-Received: by 2002:a05:7023:a4b:20b0:149:1feb:6d9d with SMTP id a92af1059eb24-1b5030fb74emr1197809c88.19.1794531546379;
        Thu, 12 Nov 2026 16:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316e195sm2760431c88.8.2026.11.12.16.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:59:05 -0800 (PST)
Date: Thu, 12 Nov 2026 16:59:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: muzafferkadir@mainlining.org
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-remoteproc@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 10/11] dt-bindings: input: touchscreen: goodix: Add
 binding for GT970
Message-ID: <avZgzxJtnMceNQnJ@google.com>
References: <20261105-msm8952-initial-support-v8-0-311ae8e8f14b@mainlining.org>
 <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-msm8952-initial-support-v8-10-311ae8e8f14b@mainlining.org>

On Thu, Nov 05, 2026 at 01:54:14PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> GT970 works with GT911 driver, document it to be
> used with GT911 compatible.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied, thank you.

-- 
Dmitry
