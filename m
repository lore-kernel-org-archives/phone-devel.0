Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B22E88A2
	for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751037277; cv=none; b=tavL1Uqy7yY6JMxX88Cz87D9tZkFTZOvu7Ar3vNDNSHIYEBxpGR2AQR4p8PgVZ8OTw7/K44KaCUu05lFdut63BgB5bDhrzjmFB1QQmmhntx5vGZcu8D5Nb/Yc/faVlcpiI2f9vi7vvofYtZGAL84BizfEC2t+yPdHc8kHOM8FkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751037277; c=relaxed/simple;
	bh=9xXvH/B+/8ovxyiaGuMlHCWofUTZqieLqJyknmO4BWc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=g6vrFllj1jktPwBthsAPqBhIhSa6VLxIGlkFgK6gaspV5uj+Va5epzJNO3ZJy+HbeQiaeXwvQpO0Q53BgTSW51YYJG5UCcR9S/GTw488bYY5AaK6zwmy67r3fr+HbQmqhdQt9OBIBbtWc0hqUfz2ir/Hei4m0BqpqnsE43LAsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I2YkeXsc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I2YkeXsc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607b59b447bso3547734a12.1
        for <phone-devel@vger.kernel.org>; Fri, 27 Jun 2025 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751037274; x=1751642074; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=I2YkeXscYPiN5DOWsol9nyFJ1uwD/uU109bB+OU8zaelyHH2VWoPjPmrhpNIw8Feff
         +TYD95Q4jwbMd8jh5wC+f8tZ4P2kW7cKtHtDq2q3oZW6uLy+i7BC/ihEBlJbPeRWG1YJ
         ZHVr2VXNytYyN3YvjxAKj4+2HJWy+hmsb9qhj1jglrigO40T1ABM8VhfX61Bb/9eowtd
         oNjj3LTj4IdICvQHQ7s40CBDMh8geJsuoT0XTIFV/yflmcZFW/OINt59Ez4JfuAP9CdL
         JjN8CyWCMPYbBHu1VrRPe0UsX4TnPbxGHzjzhzN6P6rD/3E4O88bJslKCmKbf1jp1kUk
         Qn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751037274; x=1751642074;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4YdwBq8x/9yTkh9TL6YeeP2ANBhnQ2yJ1UlsY3OJMpQ=;
        b=MIUkoWZILEtzWItZitVRQ/hbPUMScEVvQGAu01OapNgDzl0FSsnktnxc8/smxwEIZl
         m9nvo9QMBrql9j4fTHHRJgAIIhcUJLWpb3GasKJqXM9gl5vpbuNSTTLy8uEoZmYYE/jh
         AigWoQKY8Hw6W2R5Xq12iCG9F6vwVk3G1owZ2DaiSFEqdOrIPihIIo1fJ93SShKqSQfP
         xhjTKXctVBXLmyZFlX+QNhrtUoMwbtCKfnd43JRGorQfDIiYE0VYWYSKwAOk+6PdNKBs
         uvOU/uHILDvbNRp2CNGM02XKihPVlj1i25GxJoLXMA6EF1Kq72LbPqZJ/PKcHmpiEmnX
         S5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUXkbPnMc712y9jbu5Db1m0a0CP9ibSCJnYwqHpWc+HIvLpXHOpMbniIu54h/QvIPmIw19O+bN7R8wJFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqZgBE2e7yhD5b57VtuUJKwtN6XhYlD3oxOWAGaoc4Vj8qE6H3
	R6/2azXldgP1Kakc5is4CisIK02ze1RNWrQoJsiNoR9sCJSL/WfG9OMRrUO16brwosg=
X-Gm-Gg: ASbGncs4TdeieyMpSQQfWW4eHQ+cn/TU5K6ZJphRBzO9yEsU883Qgpm8quz0jJ4ki58
	Gu7zvsnlsykgYIA15tQUKIqI2NVdZEQq/p/5gAy6s/+RV19nhS8cF0KSPn+mBYleE/aBb6ZccVq
	jij9e00jzr0N6JE1wkSEqdqadIgky7+2nb8JKfl1WZnXhk/pdGfnkvVcrkbVgPFs4zmEL9GDFnh
	NiRwWnBGLhk06mDsauT+/fwRz/8wHRWEANm8n2kV+S16etFKiGSaoLJcBhBuWVUCJZQn0jZdt6y
	ISd5Ep+O54ZPU5gHKZ79clt6iDuNOF/hPbLoiRINslfMII2dipS6B4RdUirvImtM8Qu7OlVL6P8
	YqNLMSLut/YW48ZTmss9i34XKNgQZrMw=
X-Google-Smtp-Source: AGHT+IGXK10sOdRHQiQDlGMMOAu00b6+1HTHgeTGZsSXRorQQ5K4SHjAIMDlViazK5Rw9QI+EWq3mQ==
X-Received: by 2002:a05:6402:2063:b0:602:36ce:d0e7 with SMTP id 4fb4d7f45d1cf-60c88dd63d7mr2289708a12.14.1751037274070;
        Fri, 27 Jun 2025 08:14:34 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c828bbea9sm1617466a12.1.2025.06.27.08.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 08:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Jun 2025 17:14:33 +0200
Message-Id: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
In-Reply-To: <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>

On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
> On 6/25/25 11:12 AM, Luca Weiss wrote:
>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>> VIDEOCC on the SM7635 SoC.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (10):
>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Control=
ler
>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Control=
ler
>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contro=
ller
>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controller
>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM7635
>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Controll=
er
>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>
> We had a massive yak shaving patchset go in this season, please move
> the magic settings in .probe to qcom_cc_driver_data {}

Okay cool, I found them
https://lore.kernel.org/linux-arm-msm/174970084192.547582.61230540758298270=
6.b4-ty@kernel.org/

>
> Konrad

