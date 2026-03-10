Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591541C2F3
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142146; cv=none; b=JvhTIw60qzIHPDtKjsnPnTbq4mJspi9MKvPy+y2AcAtBjXrbnPKm8QhFfCkUSzXQqL/e7DBOhD6NUdkXQCMQxYd+HnyA6W3P/+FYBmvMTFaB8mxEH2kOcQS60YtGB9w/6w3WiCGILhGAwMr8bfiB5wZ/VquiYx4NGMIgxekNjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142146; c=relaxed/simple;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4NrHrKoQ5EjzBpHbVZbhcOVikXXQbZ/YeBiYgs1GIZdkhwcnWF53kxeNNovCoJ9o9bQA6HDfH/fmtqCT/DEZdoKzxAFf4MZiyXAhGu4npbEkvT7qHrMb7Zl0hPKMI2N7/II1Lw97XqYTSu3Oqcy3mu1X4eHT4CTa2Kj+KXmyyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZW3Nm771; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZW3Nm771"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD77FC2BC86
	for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 11:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142146;
	bh=C5M+Bty5YcRutCvl7AErxTfyp+JxDAgTV17V+hsuaOM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZW3Nm771/UCnueFf/eUBV1D3yHpkta92iH3jndTPOZAEAylW7z6etVRefddlIJz/C
	 VN7Z5QU5bv8dokHzUrrxNM4iwj7pXSZbooum6uV3auNhuW5F9DRuy0YVn4bNWbE5YO
	 QsX6IRG0lZpstJB7azuGAZTFoi7xYgJgIe4WLGCrVKoyTDWWG71AWbtymfL/ncjU+d
	 0j0WI9r97EeYPeCxIuHrmvN9INmGgiQqXO/8ZYR1cUCVSJX3XwxPwedRGrtIu4wudr
	 AeU3ByoGbp7tJGhv5hABrG8IX5WOH/IN6FkDGne34+QJped0igeqrpmmPNHJzqG4Ci
	 d2yHn7Va1E3Jw==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-79900d6dc3cso16735587b3.3
        for <phone-devel@vger.kernel.org>; Tue, 10 Mar 2026 04:29:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRztWZlMHhEZXMiV+hK5s19uC224vqdHi9+MpnVsIp2iV3ELHFhjNo5nQAm+WQzglOAZSLoXe7wqDE+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEJ8cEj2Gtpds6JeNr/dAHx6jH0M7DhmJtlnBa0P6RUUDRMAF
	rAyIoAlkMbPO0/V0wu4z8uROP8m+g2lc8FwfY0cqXXewXQSKblJMR/8sGc0YnsuIC6uKWdKia/H
	9Tdwu4CcJQTWGaL0jvN+UTnefHcx+xJg=
X-Received: by 2002:a05:690c:c4f9:b0:796:4b03:73bd with SMTP id
 00721157ae682-798dd771382mr133874007b3.31.1773142146174; Tue, 10 Mar 2026
 04:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-milos-pinctrl-lpi-v1-0-086946dbb855@fairphone.com> <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
In-Reply-To: <20260306-milos-pinctrl-lpi-v1-2-086946dbb855@fairphone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 12:28:54 +0100
X-Gmail-Original-Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
X-Gm-Features: AaiRm53kS4zQliTIX4Fn5ceGqrudwVM7-RS-_bNOw_f_i9rtyZ-GaueU-4PyAHw
Message-ID: <CAD++jL=6Ns=OUfE4YAuNzbvYxd4fc5BqiWjWWFCs2OaALdBnfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] pinctrl: qcom: Add Milos LPASS LPI TLMM
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 3:22=E2=80=AFPM Luca Weiss <luca.weiss@fairphone.com=
> wrote:

> Add a driver for the pin controller in the Low Power Audio SubSystem
> (LPASS) on the Milos SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Patch applied to the pinctrl tree.

The patch is minimal and simple, any remaining issues
can be fixed in-tree.

(If Bj=C3=B6rn yells I will back it out...)

Yours,
Linus Walleij
