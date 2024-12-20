Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E2F1BE238
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734689512; cv=none; b=bfUTC7Rdzkn39qt7ym/Q9ioK+88q1dWYKVPO6GYlnwVSEYMG0W2ECxEMeDiRWdVdEE1j8AzFeycQXjiBjw97cyXj+594rM/ag+BiZBB2KnYGPPNXf/ROVSP2OtFJfdbQwa1sR7NFITTEmJuKItGzOUVngjV2/VDTtX5QNQxPMFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734689512; c=relaxed/simple;
	bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=h+XrJuDIxCihaCz4Q+6gBYxUtlZpDMn91LHH6HC6HXF/2s1PNieyKIg+IUX4Z7zLZdiJYIGdZIumiGq//4JngeNwZBF8LXOJ/Kl0FjDZf97JVtSuE3akFYCgbVZSoXo85krGwKMUoGV0yjUvsbGi2PvVURmmBX2Fd88lCtYCOTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=xII7jMMJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="xII7jMMJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so774175f8f.2
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 02:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1734689508; x=1735294308; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
        b=xII7jMMJW/VkUuE+mnsE/e5LYak9IlvR/aBD49lVR3lumTHolxlrRMvAWx680e+80j
         5PKSAeC37lnjwG0dmOw+Hy4gUGkf0TquWVq4g+m6JeNbdCon75NugK9h2dE3/jP/R0FQ
         a2EXpf6+4rp5Fyzub7TZj6/SrdhpWHGYB9CBOKpbt9XRBVO8D4rRIc9xDqOqIysHhiN9
         2ztgytOwFn17mvo0hoDjy7wx8oEtZWmt1EQLVWhyi9KlfabYQXXP0Owzojvshj5B6U6h
         Q1wpW3Y4fc791mipeYi18MX41vssq/w38HOZYgQkRlr2K44p21eWocUMp1R7RiUeLFaD
         6k1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734689508; x=1735294308;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EaSdb8z72/Ef9LspwhXaWKy36z4KEu6sCzfALY8btEw=;
        b=EJBmmQe50ko1yy94EcQIa5MFR8P83Ntd9MBjLC2X4FK/yXWaRQHhlk9Njd1SP1Ndp+
         Lxf+G+GdRp2n1/vNJaRjLpcNwo6fRyizcq5tCOlavr0wCrGcT4l71SYsb9hOQTwraews
         attOPzwQ7rJWqMq9J7XQwEbnuQRLzjJUMU5IwIJhE2tV2g5BYS79pFTFTFin5sHgn5ty
         VWmy6Itg2x1ZG/hRUFVN2jBWlj0+1h/jXv9u4cccetJ8YJTGQUsoXWdzWXBXP26bQiId
         M9Aebbh2sXa5+zYg+8CaVEr5tu06hO7jc5POyascExSTEWU7FghfdQcc1KZ5YxSQZDhm
         sHvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb85oz7Dh3gilzMKnj8NDt2izpZScL+1dIGAF7CTVdGwFUPsDCwWHWogJuE097jJwh8VGqKH7ikJNI4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqg8DwFV4nGpMi8Uo893cLhYwxxbwJOIZLU252C5cs4THRv2X6
	aifc8PQzHsaBneRbTU9I7eucJxFbm/q9glGK79rIAJt6WxjCYNHZ6NTEqwbQh20=
X-Gm-Gg: ASbGncsorfGn6pxkpslqd8eDk2bhsxHd3S+vAz/mB4F/fDsQvo+HES0zVGdA3pYBnJH
	Mu2wdKsNGOQDevlvaeUUXBwaVyk2FMcXfL+HUtiu8JX6x6O3qofEDPXgGt0LDP4VkrZGyh+UjJv
	alM+f6jkbZeM8zNntNgCBD4BmJKwoIUM6OPUCXQzs8Z2Sle3OVSw4Hnd/IvSwn9cIBYhGDDKwyM
	3PV/UQ4PErw4Kcn62wSJ/lLB5kOeRz/aEChLqSzeW6ESG7sOPYbny6wQB90KUs1lFhcVSr66/e1
	iEdM7FtJqGpuKDcjhiSRHDGJ/A==
X-Google-Smtp-Source: AGHT+IHYXbF5zEgptW9K6SaQDrYDWMjumw3skuuvDaqv7mt65+EQ9elAtWEo+20ASe35/lJk+bD6iw==
X-Received: by 2002:a5d:5f4f:0:b0:386:391e:bc75 with SMTP id ffacd0b85a97d-38a221fa986mr1984788f8f.16.1734689508270;
        Fri, 20 Dec 2024 02:11:48 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366112e780sm41626015e9.0.2024.12.20.02.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 02:11:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Dec 2024 11:11:47 +0100
Message-Id: <D6GG3YBXX62X.1JV54ZRWY7B5@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Luca Weiss" <luca@lucaweiss.eu>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra
 qcom,msm-id value
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241220-fp4-msm-id-v1-1-2b75af02032a@fairphone.com>
 <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>
In-Reply-To: <a536afc9-0837-46f9-9135-c220cde7f862@oss.qualcomm.com>

On Fri Dec 20, 2024 at 10:36 AM CET, Konrad Dybcio wrote:
> On 20.12.2024 9:55 AM, Luca Weiss wrote:
> > The ID 434 is for SM6350 while 459 is for SM7225. Fairphone 4 is only
> > SM7225, so drop the unused 434 entry.
> >=20
> > Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fai=
rphone 4")
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > Completely dropping these values also appears to work when using
> > boot.img header version 2, but doing this change now would mean any
> > tooling in the wild for packaging up the boot.img using header v0 would
> > stop producing working without adjusting that mkbootimg invocation.
> > ---
>
> It would be nice if you could start shifting that tooling to bootimgv2
> slowly, and when it trickles down to appropriate places, switch it up
> upstream as well. Of course if that works for you.

In postmarketOS for sure it's simple to switch, I know Mobian also has
something for FP4, but apart from that I'm not sure if there's more
build scripts floating around somewhere.

>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad

