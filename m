Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C841B248882
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745577989; cv=none; b=ECI3M/FImgB0zJPIg94ydr7pohMUwgyJqaccwchnF5MRx2bh8WvOZSr2+cVUo0A2kFaekpt7WkYbaW3rYb8tAGBMsULmCz7NIOWqx1U80OC+lKQ45vYpgJoY63e2BefSBYOe6/+bLXiTiv19bwV6+JF0Q1apxeRqMj51W3517wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745577989; c=relaxed/simple;
	bh=85B3q5YxIURMuwDetlbKPbds6WVQ//EnUVbXQdNluFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NQBABc9DaiONi/6Rb/d2tkTtgk1BsWr3JbVQfAmvXOtFe/IsSIjEt7lGMPUi5UpHKGNcxfH1Nt+0S2cJ2MCCAN/WRugtFSmmyXBAqwo9sPUagGsvEOP2EXtUQJazQ72q1OOViZpS4jiv4DB0NwOFIZL/vNfdHnlu1rfPu5HBfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=rGeRWTWI; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="rGeRWTWI"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so272058366b.0
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745577984; x=1746182784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=rGeRWTWIj6kPYx04Y2qyYOpqkrP9wTl6YHQc4uplKTpzcd57ZLCX5q421XbHnUT08/
         e1aLWsQORsiQZ4TyvSm7HWEY/HevFZfXI/sxLRTskY3rR0uJfv8dQiHmfOFhCh4O9aw0
         uNMhQXJcwYRZsSWepjcfDl/5j48S8GK6+c+jssmDr626Hcwd5v2zngaYkM66L41reaWv
         3FT/G5NQtVHbTvrl1z/m9IOrlMdR2Gbfb8zT/acH1TeA4xmurBNlITWDKBywE3w13oz8
         sskb93lJXe20rhAlTPpT/bOB6kEajcQ6d+4qxkCRBWXjBGVe0T0dbHaBdkj86NL8SwuA
         nWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745577984; x=1746182784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JeacGZrrM+C+tPMotUpkenMrM8geMPef44l5x7iZcs=;
        b=WnVS0zTXj4S7bzGGcpYPjsjRIuhgbs+ulK+faVxyEUvVfBlzkbEjLeJOY4DuhKwJy2
         cDGk7BNR4AumC03LNSmxv07k7hWgU7PL/0fK7QmPMxEKip8Z5glQIzARBBN/Fm6jSzen
         ep/SpV6M0cbsgcpSjZMCmAPkw1zaBM45ByiLdegghALroWTqQzSDMXVv82IKnkYq5BdG
         GDZpJo4KPVF4aZIRap1becTtxc4s6hq2GJJZXRV8ttuvMrvenqPyXy7wOeIotQWbdjDQ
         9M/GPNgSKhUQZ/TXtszY/9jgeNaLxr0sLOk0i2f2Fh2ThlIPquJROsS4gpPirjQueqlt
         1yJA==
X-Forwarded-Encrypted: i=1; AJvYcCXYL/M68BNAAqD0xXvzJ2ibloK/ZXwdpz8I5oXRqYjB+AzuZh9CyOtLjvW9f4Cz7FfaoV2M7JOwc/M52w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUIdqfVOc2cnRrUfv4KxVs57VrXth5B/cEz0iSSZlKbzq/q4o/
	ojLZlBu5gC9kSH3NBIZiMGNyM/fM264wh66XEYdU3vdkFIj0CKJgZVxkmn9rI+0=
X-Gm-Gg: ASbGncsb9YXd2TpoLGQvMgKhqF+kTfYlTgMNzeuUWYdgChGgAAgJ3tXguzkUl3eem25
	PSpQfxJNpwgsKvo3Pl+8/x8iSTfPjd3qsuTT9C1diz9oT+9YaJIvHQW0qPYUqMiXhWTPPsVcu2x
	awHMHLPgPh6SFkjNrfleGzKUDQsbHTbw9YRRcjzB642Sryr8IIwzXinU/0rA5M0XOZwnwicKCYQ
	mmVIMZYLkTdmsMwsY2XIBb9C33DmA3iEkFV4cmhzJH3hung5+iZmxYhctE3KgeOO61a+cCQ3AGn
	KbNStXzhT+KexvfK0505F0ljUhTf1imrWhuWOi+a5/o5j/kEJZb+Sy41V7z+j8WIigfOiholLk5
	cGjvi+930HTATcofIeZHe+oUyQ7zTDmDrdT8l+iHGjOJaR7GX9wKfoxut
X-Google-Smtp-Source: AGHT+IGUOsRcDWXWXshgw3+eUDsixcC1XjCIOga2rl+spBxCUbc06RAYeUk78gF6BzGL5litsgHz+A==
X-Received: by 2002:a17:907:2d1e:b0:ac6:ff34:d046 with SMTP id a640c23a62f3a-ace7103877dmr173149066b.2.1745577983978;
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e7b98sm118765066b.66.2025.04.25.03.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 03:46:23 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 12:44:53 +0200
Subject: [PATCH 3/6] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound
 card
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp4-usb-audio-offload-v1-3-f90f571636e4@fairphone.com>
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
In-Reply-To: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Document the bindings for the sound card on Fairphone 4 which uses the
older non-audioreach audio architecture.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 57f62a228c262f38e703816efdcf443355052619..6f82e5cf6df30e021692015df9ad7b09d4b2c7c6 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sm8750-sndcard
           - const: qcom,sm8450-sndcard
       - enum:
+          - fairphone,fp4-sndcard
           - fairphone,fp5-sndcard
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard

-- 
2.49.0

