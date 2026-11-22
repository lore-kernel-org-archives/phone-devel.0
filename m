Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369693;
	b=Vw6VAJi4S1YMudI7bWC0lxRXxCX9cziiyCHZoYgopJAxLpoHiCro0lVvs2Ex0mAfhvgi
	 O12REhqMIPV0agIw1v6OemZvRywKsu70gCYSuQIxv6iNpeO2i88Py6bQSG8Ude0tHMH+K
	 qcBrUFWvVZ+S9ybcN0PZb3BUIzC6pVDIlpWVGizVchvVfnjGZd4QymYrEECYao3rX2PRs
	 zdosvZh8+j9poQZvT3GDar8bx0q3nsbrKpS2Ves1A5N7vitn6aF471TbVkOQAkoBWx76H
	 IIgwiQkX+kdbj4AezdkS/8D5HlE2zVm+pyJKoA0af6GxOZGyE1g0hL3OF0GxRLvOnVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369693;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yQ3LoAmHghAkj2mNsG5N71jRxNpUCjCCWO+/Gb7RziQ=;
	b=s9KAi6Amqml6MvcKyByA9UmYJ/OVIZaBLFYnmShId50Hs65n5PLkza8gzK3U3+ptlga0
	 ziWSlI7bxTUlQ/BhwcET0e548r3h0a0CO3Q7wvmIOn3osZTjcgNTGeeYkmgrYJiuAtFJY
	 cskmOzIFwvaE1XL4rn76xIrfKh0zodOMNI8PcLXXOB4Y/CzRSG9y7dK/q8H8z7BaeGVKH
	 TNGJw+vl0aUNPJzQ/ErjTAp0AxWYdHf5SSFX7312YBb/kiCAJeS1/dncNE+uYajuMtNaK
	 0J4b1QhAgnxszeJz6KXlcgEpRgQQVp529IP94bGvz6gZ4L6HuoikZPLxzca4GAuvIng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BljZ81yS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23402606A688;
	Sun, 22 Nov 2026 17:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BljZ81yS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116451F000CA;
	Sun, 22 Nov 2026 17:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369692;
	bh=yQ3LoAmHghAkj2mNsG5N71jRxNpUCjCCWO+/Gb7RziQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BljZ81ySCefCcz8OjaVbjcJUOYJLiz7igFfP9TiEWwf8u8z/x5W+Bx9sP3PEvqLF6
	 UdSSI7UHKo8xpfhO4mcAW3Wz/qAZWzvS8UMaM/ZEEXunS2FOyRD4PHLw4OX/5rLWEJ
	 osGBy9j7cPc1EYKzMlMloYFdam/CoNL/gvwVaF0HbjWX9is1Ei1wfUHltUc2ZJWSdX
	 ztjzg2QpS+ZVHbNql+yvkvBxuPI3sSTXAWFHvaV5eR7jmaz8fV6+W0pKz8xs7JTQPB
	 jZFzaWVl7zA1V/5O9F8HzSTtpHGOhYpHithlL/BRuRV8HCOKYKTf/81JMTefPBWDwj
	 myDgCo1ptTaKg==
Date: Sun, 22 Nov 2026 18:48:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v3 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
Message-ID: <20261122-vague-arcane-collie-fa27cb@quoll>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
 <20261120-molokai-soc-v3-3-403d763685d9@yahoo.com>
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
In-Reply-To: <20261120-molokai-soc-v3-3-403d763685d9@yahoo.com>

On Fri, Nov 20, 2026 at 09:23:05PM +0530, Venkat Yadlapati wrote:
> Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
> which maps one more range of interrupts than the Kaanapali one.
> 
> Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

