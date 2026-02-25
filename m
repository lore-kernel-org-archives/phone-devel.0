Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D852EDD62
	for <phone-devel@vger.kernel.org>; Wed, 25 Feb 2026 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772005114; cv=none; b=X44STkT8PFzMJQCLPTTHW4lTDhu7cHRmZ0XrAz7KbGLKgHpWrc9aba4HOhojwzYqkih+Wud77K6xli3ZSGVsyzPW3+SnCCFXFGJpyYPJ3l6Z2SSTcCMUPMLXL62+vZKZp48ykJ00YYvaxD1EMCx+bbU6sY4caYwyDdqe6jcFqKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772005114; c=relaxed/simple;
	bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kxPe6FtUthfLk1s908oMPgjvFDhXUGRUBsOdhQWNEHQ/nP/eRRlfRlZDEWCjf9GqY16PvLsJm5dIpJb5enWGBLPUg0NcgPyi0CJZRwsRRHBy6LXVcDQEhETtgqvxZbEWCoRb/wmHEBroxWqoDGtXfH1G6CAKhmQ89aicpKRy3c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YFt0B7kz; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YFt0B7kz"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so1109567566b.2
        for <phone-devel@vger.kernel.org>; Tue, 24 Feb 2026 23:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1772005112; x=1772609912; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
        b=YFt0B7kzDND5OVl2+MnPcsAB9HGkjCkn/jj4r7YU5tBnp4y36qwriwD2e5CJdI0c/6
         1sDt5AbR0J+c+HHL9iWMYCeX6umOneiuoC0ZlYQAXmOO0/iqYeTbkdfSkC17K8fzxtGq
         /zfB36IRQ6XEmyLqYLfAAdNlx+L+e8uYv0oyjuPlGY/5/FYMEHHOWNr1TkEwHRZnV0mo
         ML2hpvsd4YdzGSK6FtoOvy6TxNtdTaUvf7+r47vbkl/ciYb3wl0Cwq3OMvKh1e47NzxR
         zRI2ex3XM0JpGH0xJGYSrUPPiCbNLbZBcn1JLffUfpiP5p0Y+wK+WTCgrntBVYa06+eI
         xiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005112; x=1772609912;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBbXuWLXblfk6OwSd9oD/neH6OS15UC/fy5GctQv3UE=;
        b=EhcSM0UzlT41z5a83d6RcrTQ5bY9ho62N5j8O8Q5EZZ0X8Lge7bkIN9CbYQfQo1+6K
         GA1ndT8A2UHMUbolgL/gCVJ2N1d3i3qXod3qimdOzQ7iBqjf+wBdiihVWl67ZKkZ5Biv
         Y4kEq2VtiGYTvtnP0XF4zYb55ucwia1V0WHwD7yn+CGqJPFZAcFCFquJVUgEx5l36gNc
         xJWj9Rh4QJ6MWPTD3cvhoCzOW1zdOlXEb9SDWiHlWII5UYGVDax3FspyoIFXLOCBOZYf
         bSbv9j36bXGsIIuQsHC+RhpxznRkr0u3vbj6oIdB2mjmwhP93YPLHgG7gLRx6yunv5tX
         CbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkBQNk38W8vPX/OicV4g2DiCXweFjMe+NZy8VGftKR4UUuPjviaMCY1D6B9ApAV69aA0gDe475zFc3Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGRUU+PD5ZkNrYO6WHH1r1Yc52EUaH+xIcbs5E4Ae/IQkwEIAl
	CaWXMwZYWLMaOQKuqlsZ6mN8hKrRlb1zV6FiCVq/o0wPTA1VY4Sm0YS4fsfVcbxe8XA=
X-Gm-Gg: ATEYQzzSoaDQtqTgqUAU0V7l3Jy/U4rEhKmXfDxbV65z8y5f1r33qipkiy0RquN+HBt
	XslRepGDLAAgNDG205JB52T//lyY4c4O4bFFrktkzgsY8tWMQAmCaHJKN8eqjq+yjNsMhyD9++/
	TdOMkDpTkJ8HVgXw85kHMgFUTw/5BAo5O9B7aY6fwvv0z2gy9l7CPcq0ptr0tz3kcwG+Ys60nnl
	YYYiGjoloEUIGyvt+fsBaeXCWy2Br5gxP/pBkbkrwAMZX18WEAq8i1Epq06QJK1YXPCy+DLelq8
	+PJoZUbD/IzO85gV8eAiNzGbB+ZtAKksbdC0ac6VcvtuvH3s6jfBKyH7mwRGX9QRaylzq7usLTq
	KtqCnSwG+viqX2+CouMsjhZBn4lgPmDGHv6Fg1iFYxbdfmygVQiYdNXuEpp3sRFP5Saco7g0rfX
	ojJwFWiDwognCSquHwfstB1eqE/nh9IzhCQkPJ/5aJ9vPyJjpjg6S8gBjluLTieLcYnfe8
X-Received: by 2002:a17:906:eec7:b0:b87:c92:25bf with SMTP id a640c23a62f3a-b9081b23d71mr868904066b.33.1772005111791;
        Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084cd4adbsm494528566b.29.2026.02.24.23.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Feb 2026 23:38:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 08:38:30 +0100
Message-Id: <DGNVDXQTH812.3MCVKWNCKR8B6@fairphone.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>, "David S. Miller"
 <davem@davemloft.net>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>, "Avri Altman" <avri.altman@wdc.com>, "Bart Van
 Assche" <bvanassche@acm.org>, "Vinod Koul" <vkoul@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
 <linux-phy@lists.infradead.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: qcom,sc7180-ufshc: dt-bindings:
 Document the Milos UFS Controller
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260112-milos-ufs-v2-0-d3ce4f61f030@fairphone.com>
 <20260112-milos-ufs-v2-2-d3ce4f61f030@fairphone.com>
 <DGDW69W84LJ1.2GHM2WU31VANR@fairphone.com>
 <yq14in67xwd.fsf@ca-mkp.ca.oracle.com>
In-Reply-To: <yq14in67xwd.fsf@ca-mkp.ca.oracle.com>

On Tue Feb 24, 2026 at 8:19 PM CET, Martin K. Petersen wrote:
>
> Luca,
>
>> I've added you to this email now since you seem to pick up most patches
>> for these files. Could you take this one please to unblock Milos UFS
>> dts?
>
> Applied #2, #5, and #6 to 7.1/scsi-staging, thanks!

Hi Martin,

Thanks for picking up the bindings!

I'm surprised you picked up the dts as well (and modified the subject
line), these patches should go via Bjorn's qcom tree.

* scsi: qcom: milos: arm64: dts: Add UFS nodes
* scsi: qcom: milos-fairphone-fp6: arm64: dts: Enable UFS

I also see these in your staging branch as well:

* scsi: qcom: hamoa: arm64: dts: Add UFS nodes for x1e80100 SoC
* scsi: qcom: hamoa-iot-evk: arm64: dts: Enable UFS

Regards
Luca
