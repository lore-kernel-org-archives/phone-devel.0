Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96362219A63
	for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 16:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713221; cv=none; b=ZL+8fyBqMky/hyd9kSGjxuzydfT8Xxbq3hniHZB5+A+ujmF8iTwjIZGXTeJSMBoX6a12UtwCUSospDshlMpM5HFkTD67xR1Nec2mTUU39oonz7q1e9v69S0skOkm2r04Mzk9gAXS7d06uvapdZm+VRYPkgznXhccgJvzUBI64bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713221; c=relaxed/simple;
	bh=/B2hFvPofbZI1fc2VO8E92d2OtYMYvxKg4TvrOTtaAw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MuDgAv8JzjpzhP2FuH+SQluhzxttNdUkYBTbWiWCFnsWCIqdeU+jfUqKobSWECwF+MYDLKstLNDXBM6z8bXyk/zasH7uaCZAmJl0v1nw1KHm2sIx0uR8InZVXgSafo/u3fimoDasvlffxl3jbZUBcGljWJ2wy0g3Tu6rHTt+ptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkQbq0JR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkQbq0JR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361f796586so22972955e9.3
        for <phone-devel@vger.kernel.org>; Fri, 20 Dec 2024 08:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734713218; x=1735318018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pN3NCV0VK/uGJibMQfEcSGLqDK9XIPj1wk3PZ/vmF2U=;
        b=IkQbq0JRWjKA2GALN8m5dAMffjC86Qjc1xJ9WfGsRQHT3FIH8hdJkHeCMg3cUkj+4p
         OBply9sQqML/udXphC3PIRn/Qxr8C4enzLACJIuqesJS7oLlAaa9QThZmkXCDtc651xo
         SurdbjpEiCbXW4ImaJV4kUaDnDUB0IQb9DJeDs0W67U4IvV72jj7TmoGR5nlUUNRUbjw
         kXWC1k2qWhywSkyk1eZvl6jHV/uB8dVjbVFongLfkTgAQaI+aSbIbk2t0n+TG/T5X0VU
         232PWtUYwSYNbAGZ1pTVNGzpeWJoUDWG7Ex7QfKnC6PBULN7qVo30sRCtifNcco2ybC6
         ZOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734713218; x=1735318018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pN3NCV0VK/uGJibMQfEcSGLqDK9XIPj1wk3PZ/vmF2U=;
        b=gWBw7wXxcvZoGjmFN8/WpSRpWDWT9Q7Mza/VTbIFGBSZVcznKSvDnXCp/VETWQclIa
         VBH035Wa8ufgxKQ0kJuMv4RL7O1i1ql0gEKMr5k7ELZvBUcoFRQw6kwgwcsgwK/C5t5j
         B/zKbci3liFZRdiycW1hABfY5VOLDahJmmIPnhAjQFu7VlrB4J2J8Na/SOAefI7hv578
         8iFYMCjRhS7hk5jHCTnrgauzdP1NaAMsz0PHUMWbEJdaZ0FKmNYjB4oHpW9lgPCe4t1N
         17kBZYSvtgxmenYeLHOTvr99Uj9zsQ24z06Kyd+od+HO/KAaD5kuEwUyNawq3S60TXpj
         QTfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH/L1yV2EtA39jnf12ZU1wANBf8ZhPlCRrRJRAFXo1U9Nxi5ch6XnvFA2Tp0OJE+9wQPBim5pXAcOzoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxoUZOP6MYgQNMiJvwoq77xwJoIIbs9gBqWhTa58FjYlWhshV
	27uSJErzucewA4SIWFRRhHywMEXg7NKhP9AU1MWrHJYRMZNIXk5bSTuMLo3NXIpqbfps926vjO1
	x
X-Gm-Gg: ASbGncueuqUd1124Cr2VfKk7mrZJ3o4jAzXI7nQuIGk6QLXyNdFwESs+cMSOrObNVnl
	vEiP7zUiZQy8+SDN5eoO/2QjprklohJ4IB2KKj85xFEXZnVf1wfdi5Md17V/Ld5JTPWejVhGL82
	HYdVP9v7TG3qKrhG4ZTf0nQURyZMbt5+aGiPN+Tt9G2M9/vcEi7iuyOzRWRPYchry+TuDKfqXoe
	oTwa0dhtTGsRLjKtFV5xiqFrcvYR7Trif1iOzDYGr4ZONayXnigtAIt2mm9Ug8zGO5yXVKg8rc=
X-Google-Smtp-Source: AGHT+IF2qOn5DQvkDWQOOGonC75zrI8OJerUlOXhUaC5o56J1R56eQiHy3EN9O2yh86rk+H5NyWy+w==
X-Received: by 2002:a5d:64eb:0:b0:385:fb8d:865b with SMTP id ffacd0b85a97d-38a223ff5bbmr4232823f8f.48.1734713218009;
        Fri, 20 Dec 2024 08:46:58 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2f9sm4546038f8f.81.2024.12.20.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:46:57 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shyam Kumar Thella <sthella@codeaurora.org>, 
 Anirudh Ghayal <quic_aghayal@quicinc.com>, 
 Guru Das Srinagesh <quic_gurus@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
References: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
Subject: Re: [PATCH] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
Message-Id: <173471321721.223061.15271739555049260433.b4-ty@linaro.org>
Date: Fri, 20 Dec 2024 16:46:57 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Fri, 20 Dec 2024 13:22:07 +0100, Luca Weiss wrote:
> Let the nvmem core know what size the SDAM is, most notably this fixes
> the size of /sys/bus/nvmem/devices/spmi_sdam*/nvmem being '0' and makes
> user space work with that file.
> 
>   ~ # hexdump -C -s 64 /sys/bus/nvmem/devices/spmi_sdam2/nvmem
>   00000040  02 01 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
>   00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>   *
>   00000080
> 
> [...]

Applied, thanks!

[1/1] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
      commit: ad71aaa9083a7ca8be9105d30a3eeaf4937234f8

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

