Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367645;
	b=PqPARHq59+40+XgbWnS0MGtTso6hITLOXGJtNq2yt7h+CuCs2MmBH+PkMLJdVELqLZ44
	 n91Ny/D0gpmwHjahB/W6mfbg3i0to/OOvoK6lfonBJZPWprYQygmudXpKDRBdHEykJ6Ez
	 NTvwtgSC2fnDhbpYg9g4IzxIOwtHnFSAyf+gE5hOHTgsX7VQIUeatPqTtwleH0ms3PQ9U
	 FO8/tFvRBEayg421ANVG8FukXYAzQcZfuO5cgEqgZUvKPSnMUBUYAAuUUwHO6VftginbS
	 yWdgWLP6IReVt7fBrWMWFnkcq4nlaESltGBflDNMq/gzgzcSXno9lZ+ubo8uERtabDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367645;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hg3EGrM+MAlMXj1qcbGlUCJV4XKVDtZwSUpQN2HkElQ=;
	b=aYiCGJfwH4MJvlDYgdo/6M6NrK1f1Q5eaRrX6XbCvvbFPb2DUj+wzgmhjll4zFCzdGTv
	 UzhGGcIdlpdJkKbE2bM4js1xXvLNh9UKrpqag5uiZBKXgz2foDq7zk5jVF1/W9c741ppA
	 XIwqpYPAc9KerGKui9dSgoa4NwD0xvDwevbGm6onJ+Nr6OS4j7OI4I/ru2xtvcSvE8zoT
	 bEizgIQ4I9nyk1GEOgkTv4Rm1aloEQoh++YKWW3k4ZzXtliZ1puUzTuAgkBGUOXrDBEg7
	 Zjp3nhByurdZ/+3/kVImOunrSlYj1s8e5MH3JflVjAkTfdKsfUhuhhqnvdunfoXnT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOIJYPzv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99CF606A337;
	Sun, 22 Nov 2026 17:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JOIJYPzv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C9E1F000CA;
	Sun, 22 Nov 2026 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367644;
	bh=hg3EGrM+MAlMXj1qcbGlUCJV4XKVDtZwSUpQN2HkElQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOIJYPzvZc+Pc5UeH2+kXswJkhhWyLTmKaNiCEOv8wGr6VUZOMPNxg2B2qHeKqSrl
	 /jhr9hrrueyftxxQaxw6uThIeBky/G9IVSZZOBL5fh+xktSwnLI/jDEWp2/9f4rn3Q
	 tELOQktKkhlI1eJbiFNGebS+CyNSixufaIFaQ0jGeQAeb1aYbTrszuNpK4U8giEWQ2
	 +FYqpLUGWG7KemOCZQq4UHAg+EPm4N0FhPH7e1mCIVCuG/RGrCgWsDWRwuDML41sMB
	 L/summMWf8NxAjpfbdwXxkPx/sb7TotX35rJ1cv1dlvzhY+PUGsSrWxkap5cs1LUxp
	 PcHPYKi0clLoQ==
Date: Sun, 22 Nov 2026 18:14:00 +0100
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
Message-ID: <20261122-convivial-electronic-stingray-5afda6@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-1-403d763685d9@yahoo.com>
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
In-Reply-To: <20261120-molokai-soc-v3-1-403d763685d9@yahoo.com>

On Fri, Nov 20, 2026 at 09:23:03PM +0530, Venkat Yadlapati wrote:
> Add the ID of the Qualcomm SM8845 (Molokai), a variant of the SM8850
> (Kaanapali), as the Motorola Signature reports it in SMEM. socinfo uses
> it to report the SoC by name.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Some folks started changing the bindings here, so how about stop growing
this ABI. Add a header for socinfo directly. Let me prepare a proof of
work for that.

Best regards,
Krzysztof

