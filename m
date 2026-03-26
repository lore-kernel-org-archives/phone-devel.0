Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E853A1691
	for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 18:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774550501; cv=none; b=Qphe5ER5dfoNFZm2+cOdXAWUGV4UM8QaXqwJgFr8VKBlq2CPv6yVGtB4i2iO29t3GNneaURIc2O4CPRUMrRKLv2EwbZEnz+LPI0gQ/K5OMUOz9bMoGtFoieuUi+ZYNKgX3w0SFwRI2DH5/EnPXQBPqIIFWT0mydz5UghSkXU3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774550501; c=relaxed/simple;
	bh=bJ6aPe/Nui+QtwM6pXeCZFiQSEzOXhL5o526MBBhQg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y81EnO0Dx1mMKmWRyuCo7LnBTp12fbxubfsYMqlBBhzuQdJnwZOppdWCPdWFN57CZzxKGmW+Zj6KIS+LH92S4YVZzAohQMV2UjyYFdeVTK8SHKcc2Ve1SusIQw0Ho6inYREq+GQoOAijlCwJT9pljxL26d5mVUY9vd7AFP7S9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0/avLhY; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0/avLhY"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c766a95a72dso954435a12.1
        for <phone-devel@vger.kernel.org>; Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774550499; x=1775155299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=g0/avLhYWeUQAjbmFQB51pk4QoETWtzlA3Q0BknjGbf06jt/6R9vn4B3WQhXXLjZnZ
         6SQaGWu7aEj6MWXJ7Kxz1a+uPvgWuhV7AV85G54CLZR7c4mqFqNbRJPZzrMvOfk+D3a8
         hwyOO20Cpyzg4euDTEikpGe1V8t4dEqv0hsNQ7JmwsIoW2TI079ACg2e68YCtincfnhh
         GDou0kXJodeK1I+cWrS39G2RMH74/lZScCrA759yMO6QKZYiOz3ZTgvVeYXVxyfKnhpD
         pelNt5MmZVcNZbohGy8H6Nk0IOfcQ4uyhxg8hAyHN4qm4j62FffWbKzFymWQVIC3P12m
         D3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774550499; x=1775155299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwjCW0nYj9p4CO0/GU2nqORuahjWsn3xAn/vBQiDUkM=;
        b=FLa2jNzhRdPepH6A0tHd1y5N0YwFRJhsJSV2Pz2Olfj/3Pb6tg73YzAeVWSUocnAEx
         /7v9LcvJlwZhlkmUJf38VFC3Md8gEPzzJYONjVfhHpKWme4l+zdoVnuYojOPuhoLkOVE
         k/ckQfzE++KEa6wco/gtHV/35e9tPmqyXjqdZ0ySlb7wAyeBshg3LKDCraFsn5OplyS5
         Gc9ub2D/homiFnqf7QY+6CMgt7lJBo4OLR5yiRTsIa73T/08ziTml4XtL2+BF0QYPtBI
         SofMZU2n5Jw4X8BthX6C8OxmTBIj+OSLt7bJUiyaLGq6vjohMMGdpXZMDyUaBqumTJw/
         atig==
X-Forwarded-Encrypted: i=1; AJvYcCXDDGKYiIg2vZMtlCViDMcek9dFDi0AwXtPr3Tp+09H9S9pyLGpkZ/kZbeYkbON0r2dRq5HzRfnfOXiAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxchd34S4WuI0hl6/Rut4Zbc9xJ0DNSO08Jw73YTlBgaAvEiqDb
	DVYmLNqMY+66S7Ra1EQCNwf5ina6U6V0oeKyw4refZfWLKCioOVo5Cx1
X-Gm-Gg: ATEYQzxAWI5S2ZdnG03uZIBhh6nmf7D1bVv6OTI+z65oixodtxUPr5Aui9vh8Xtshdz
	N2X0KVAJRH5Pa3LXGnXZoHonPFV0qLkEfEt39GDmm5RQDiQq3WC7Df6NngTkShKESUCzxsYNXyM
	1yAAN18ARk/gZoF4HN/M2cEBpg3MQTJjV1ONfYOsVsIsIk7Xgq5CwzU9HtkS6kxPquSjP03YYUz
	4b2REpqDi2brTCrnJh25tGmrRj3CIsRA3P0T4Fnv+eYQB0cOSNTgfyfFiOy0707/5QEKwLipk0P
	OBcfAJsu28LlfLG3RPZiWNaR0KgFceIsGy7dmQrVsLZEQ9tXidlMc4DOl6BMIVIbfS1pNS6rkJ5
	hTeyWERqnk0311FUxNplS9dy0Y4BogSIxE8NXTukSCydlhYh5ICk9GenuZ4ngBmZvHVc00laqRE
	5uww2gAwTcf6bxxIZPB31G
X-Received: by 2002:a05:6a20:3d81:b0:39b:edcd:d936 with SMTP id adf61e73a8af0-39c4ab8beb1mr9569115637.16.1774550499135;
        Thu, 26 Mar 2026 11:41:39 -0700 (PDT)
Received: from ArchLinux ([43.251.91.119])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c76737f42dcsm2983400a12.4.2026.03.26.11.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:41:38 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sean Young <sean@mess.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
Date: Thu, 26 Mar 2026 18:41:24 +0000
Message-ID: <20260326184126.9280-1-nathbappai@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd71e35d-5dd1-4341-bcdb-d082dba41d3a@oss.qualcomm.com>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 26 Mar 2026 10:29:49 +0100 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:

> On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> > The IR transmitting LED is connected to SPI8 controller.
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> 
> [...]
> 
> > +&spi8 {
> > +	status = "okay";
> > +
> > +	irled@1 {
> > +		compatible = "ir-spi-led";
> > +		reg = <1>;
> > +
> > +		duty-cycle = /bits/ 8 <30>;
> > +		spi-max-frequency = <1000000>;
> 
> I see the binding allows a power-supply handle - do you need one?
> 
> Konrad
> 

I have tested the IR transmitter with my TV and set-top box both.
power-supply is not required and not mentioned in Android devicetree.

