Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A50C8E6
	for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 13:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149437; cv=none; b=ex2vCE2xU0Egtyo7c8fno51Emse2klDQZqk+X5SL9G+RCRe5HvEdieOsWxnOFDBoklgKPXZ5ZCQ7Zt+UhiPdKA0jGCEcrPsTVGas0zWq/IohFqAgedd6qOvL8zHaqqx/tAdcXjxXZzWcocJvQsrqdZXWz1GtgeazMtEVAuvoiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149437; c=relaxed/simple;
	bh=EE/IMt3bWpzuwoh4Y4VtblwKWctMNVKGBDh9u8GUYg4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Qmbb7Ixx36W1okf4WLEJ3fSa2lcALeTYSOoFs+cIIEQo0C+ObRJ4000wr5djFu2A9b6qiJ3gHYBRDU96G/imLDdNkapLdX29oPsFL89b21UYFb0Z70P5cclTG3PQhJ1z3XlL0OffdcLtR7NSTadHY6T/WfdyN55xt87Zsc1hhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rdkQli19; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rdkQli19"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso596208a12.0
        for <phone-devel@vger.kernel.org>; Fri, 19 Dec 2025 05:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1766149434; x=1766754234; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xYZmg2CKda72uPjDDhOOvObRBbG4YdmNuqSLpmH/Go=;
        b=rdkQli19NK7ZEFHBRsA5+cEoaTtjs0dkJIY4AiX/DVUiiCUmYs6ErlxDUXa1ZNQPV/
         Fwj7zF+TZE3+sx6a5lBgBF+lLAkpjj+eKs42IIyJLTP4AjRzaaCGVVAg8G2w2JofOQ61
         OqOi4XmIKyot0DosmjRoIM9NvTnQ/QkiQnYjf3mM0+fMHyK/2Gr0NPpNZ1ILuzpXGclf
         4hvOGVA8nUKkH9tUXicpXtcDK3vOdZC0/epBjlorfgUOzVI6d7pJx1+pfi4GHt3XN5MR
         knAIyiWTFDad2ZGMGOvR02ssNj9LxLxU0f6uW4oBjqumk6ixccZj9TTAoqFC3zCXooV1
         c9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766149434; x=1766754234;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9xYZmg2CKda72uPjDDhOOvObRBbG4YdmNuqSLpmH/Go=;
        b=JJYqRjbevN2wOGp27FEH5mt+nmbv1hj5KnIa2UY1wfo9yePbNWrd2ohUFvA/5EfCO1
         ZgHSAGUxFx/Lo8fULPgjAB+k9hc9WJOsEBSF87K/g0SOvBi202cHb985bCRekAdaOgMJ
         5ur08yBjrpgeTD7vb5YNswhkNRhGLbd5h4z8ukbRc0c1GcCKSz5iSgQPgs55UE280zPp
         D/QbkNESrb4WoDd5KGOtUFDev52xql1eNObY0b0M4X9tp1vxwF+l4nIuD8vL7TcONgeP
         heYSPBNjzx5/NhCXHs03Y3ulQvHrwQkRYOZ/Mv3J1Jk+BBsp7wggB2JdXl10RaMFBoj0
         UnmA==
X-Forwarded-Encrypted: i=1; AJvYcCVk1OUmHc0hBNjy3qIoOy1dcMave91JobPJKjanbrMDML/y8DbR+uUBuZ1qrpjhzOMOU7gH0vzahdyphA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM98nIEuVXtAvWNiPR9Wxx1RXCOFgEcyy6HohSACj11kh9erw3
	TJOtAWesw15B1Iq60Uddsqnda3OQmcMhAvnr8ksUWSs79ht4gafrsRqWHHXZsRnauU8=
X-Gm-Gg: AY/fxX5BCUx1IcYpU/of+VBtcGd0kz96W/UJwn57sn8tqZt+oaeovsq5ipjYoGnXACc
	hODTfPfpKuuE4gFAxk2EXIkANrufEZUREa17I0ol9Zz86f17/iKC4IZJAd7kfiLjqu2JuNdvZVv
	JNwb4hdYYjEZkjwPxTQe4y4TlZq6NNJvQf1/iAmO1uB92xKSvSj4gf7H8j1WHSq3R6a+CLtO7TW
	yWKPvD9XTD0IZT61xVd6nzw7s7jQ+w6yHJSb4NHB0lZd5LVCcP/b/K2cm6/k1MJMEK2Vt5MNpKT
	Ao7xd+i+NRJtTahNYSsPACq3YGkvia+6dC3TeQYo2Ub99j9MQbs7zlr/qrxI3/Tgp6fh3akPa2M
	5fKLn8w8ZADjeU+Fz84HmxxsG08TFBq0mkkseKmjpS2faLkr3oyd+CxIYXt6tDsnhsKy3q7JP4+
	Dpcqjps8/leNqB+wUEGXlHKgwThVXOCBDEeY6H030SwqvAz5Z4BK1caKEyUzbnYjBOPN17gWHRA
	UAmmV4EZJD4GeVJNJbVmUtU
X-Google-Smtp-Source: AGHT+IEUfFWnQG7RAyzRaKjx7Ol55uUIMDfqgbftEXKGsTsm+LxGEOqp3Py4SFBBhTsoJjx3bbI4nA==
X-Received: by 2002:a17:907:7ea2:b0:b79:a827:4c4a with SMTP id a640c23a62f3a-b8036f1308cmr281276266b.15.1766149433565;
        Fri, 19 Dec 2025 05:03:53 -0800 (PST)
Received: from localhost (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cb27sm221143266b.51.2025.12.19.05.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 05:03:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 14:03:52 +0100
Message-Id: <DF27Q0DG1UZG.1Q5HP9SBKYBT0@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: crypto: qcom,prng: document Milos
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Manivannan Sadhasivam"
 <mani@kernel.org>, "Herbert Xu" <herbert@gondor.apana.org.au>, "David S.
 Miller" <davem@davemloft.net>, "Vinod Koul" <vkoul@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>
In-Reply-To: <20251210-sm7635-fp6-initial-v4-2-b05fddd8b45c@fairphone.com>

Hi Herbert,

On Wed Dec 10, 2025 at 2:43 AM CET, Luca Weiss wrote:
> Document Milos SoC compatible for the True Random Number Generator.

Could you please pick this patch up? It's been on the lists since months
and blocking this series from landing.

Regards
Luca

>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Do=
cumentation/devicetree/bindings/crypto/qcom,prng.yaml
> index 597441d94cf1..a9674e29144e 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,ipq5424-trng
>                - qcom,ipq9574-trng
>                - qcom,kaanapali-trng
> +              - qcom,milos-trng
>                - qcom,qcs615-trng
>                - qcom,qcs8300-trng
>                - qcom,sa8255p-trng

