Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369664;
	b=sJlSYuhNJUDhLbKlngUcCXpqeGMekpUDSJ7Z6Mv2x57AHLgrDZqGSVLMZ0iShZHPAbM1
	 5iHsnPqnPWmd2MUOh+ou2/IRWK0FEnYsKVAw4OFuaSw3/qrj87Otk1eJyed7v97uLY4mA
	 +KhYp5KF9luPtsMTTBQb2pyRTUS2DeE1Jc2/1dK3AAKqxuVD0nbbxr8HDWR30o7V4xAod
	 POcaOdbmmbV5BGjBXvILtQwRSSe++FZZ/09c5dxYmFxtfhJM4vUWiWHvPMVP/qkhpJuHZ
	 0uZ6kAP6eD2aSZukQIbsYFV8dGCcmgbg0sVetUVP3cr8l7Qk7PCXluVF2XWgntS3mBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369664;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kTI+x3eR9/fye4hy68NIkj31QquIHvu1a+2Mc0xYPcc=;
	b=fLUG6Lsl//sD4zMCXYSLrnZSJiejRR2KiDKuHVGuSClsfvBgWhXZhEOoQzmZNDFHMZ9J
	 cYPogXn0GhG/LcmMMM0nlnP7vW1z2HON6XYqq3rqnjJLKh+jqrGDtgStU7ZKHzjheuRST
	 VdYLhAUSbU4qEjHK2mPv8V5nvaj4t2oCZy2mvVm1FylWnP3sJBsnMEqtE/VX5yQvY4Agg
	 PWfUHh65JmSuN9XqqtfopPF1Ie8ArT6XNvJbrJGq7RxaSKF7R0WJr/3fRBrzrPIrQ0BlG
	 Q7yfRb5vrFWP4E8lLrryhMnvj4kZj5EB6sfMHNV7KWZ2vF0G1w2Xpidq1CdvL+I7wwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXYhv8kK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A991C606A68A;
	Sun, 22 Nov 2026 17:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dXYhv8kK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D1F1F000C0;
	Sun, 22 Nov 2026 17:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369664;
	bh=kTI+x3eR9/fye4hy68NIkj31QquIHvu1a+2Mc0xYPcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dXYhv8kK3ic3YvG+a6aoUeQi4hkJ3JahU7VWv3qpLy1Ns0T9b397kMll4Uj4Zk+mt
	 n8MMP+SEc1J4HYRss19sSQgD2ahXPvqpBDHDO6O+vOxhmEbT/70YcZ78kUvWCNwItm
	 ilftl+EpYy8PgIUrLnwLRkbG1DK94Zus71K4G7XOdUXEXXxeoFKL4SSSRKhHevRuNK
	 k4ENIUIXONy4TSdqQr4oKIar9HBdlkQgI+c61c3rEvEYgavEh4K1NZQ4HEsldgK3Ji
	 T16hzcj9ZPcRL1zrkuTTOTWxRFiUDxit/caJVBF2hmD57gIywzChUB66/frDIZxkkP
	 W3atUXyfU79Zw==
Date: Sun, 22 Nov 2026 18:47:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 01/11] dt-bindings: arm: qcom,ids: Add SoC ID for
 SM8845
Message-ID: <20261122-spectral-sceptical-wolverine-3e510c@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-1-403d763685d9@yahoo.com>
 <20261122-convivial-electronic-stingray-5afda6@quoll>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261122-convivial-electronic-stingray-5afda6@quoll>

On Sun, Nov 22, 2026 at 06:14:00PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 20, 2026 at 09:23:03PM +0530, Venkat Yadlapati wrote:
> > Add the ID of the Qualcomm SM8845 (Molokai), a variant of the SM8850
> > (Kaanapali), as the Motorola Signature reports it in SMEM. socinfo uses
> > it to report the SoC by name.
> > 
> > Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> > ---
> >  include/dt-bindings/arm/qcom,ids.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Some folks started changing the bindings here, so how about stop growing
> this ABI. Add a header for socinfo directly. Let me prepare a proof of
> work for that.

OK, please rebase on top of:
https://patch.msgid.link/20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com

Best regards,
Krzysztof

