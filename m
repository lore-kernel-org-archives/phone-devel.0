Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFF2BD015
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931194; cv=none; b=RyoCcs+rrPlhvAJ/BLmd4Vw6gb50QZ1iUvEaeGYcwoP9G9cicv64qTZGf4tlOj/oGbl1VSPGp3U9zyBc6eseBSVtTj8Ft6ryUlc8oqzw7KDewljIy13MWiKfmzeBiLwpMX6ELFB7juk8T+I1zzy0forjFi/B4wuF+HWd48XbdnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931194; c=relaxed/simple;
	bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=dq/2NGv3e3uvYAQCECiOGXjFjA72ST56TWBXkbMOC3iEegLgCxaSYTx+Qp8vxKhzZokYBBYrKobqBApuROhPCAYOgnLZyOxnMkXpGeIIlO7ILAt9P+r92qFgjmRQTRRAdgWfYX0vNIBfOO86Q5Pn2K2sY0AgGGaaRL5Su4eSdes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EyOISVt3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EyOISVt3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477632b0621so13940845e9.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 02:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764931185; x=1765535985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=EyOISVt3IcNqBjNzKBPVLixt7VHbxvSfGxOvF6OJNqG/Q5ka/WiKsHBAO2G5lN2BlU
         M3HIbSLDX4fA+lusj4Pq77rEbS0ecT+lSnw4+Hnwwr+iqEeoU6mq/C/32RCRnMl92bn1
         plTperEaxlOB1y2tN83UGvkJahEhcSRvXz7ad+p/qIYdDHkMDEVxZPfwyAkDcExex9kQ
         HfpIStRpGPUMSzNfn9M/TlP/wVASmZZNJy64i5Yhsw0O+twro1IbRwG17LUYCsV/B/78
         LrW7P8cl0If49cTJ/H8BbjB32x3Q8yvSdyzCMhmup1TaF2kSoKKEmh6tBsp+/nzCwuoT
         4Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764931185; x=1765535985;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5zYQo/pdhvmT1AW6TQbgPX3NoefX45zPL89CUC7CN0=;
        b=cZ6B/NiDEL8dyq4rrQoGilArsKEM+nX07IrAY7hxpdmxjOKrDEchbeU/KI7m2KBhRC
         Z7qMqCoQTo152w3pudSe2aDfceDW3s/2/zPkyBa7gg0GAPs+9J/zBl6bN17CXYexfSx7
         2KZXHEzSikOpbYlxcJHIBdE2KW38NPRkrNObdQT04m5kP3erIdViRqBmm5pW33Fy213U
         2Cyy8IU/ddnKMM2XiB81z92EckiMcWzBgjtonhwrBcyzrVaCSMZqA21rTOAxhAGdgrEz
         fEbhgUXuLu9mGBCAzt722vEVu4Ysx5cPyQJ5Dfhtmnl2I5YvbHUCIeECgW3ezgY3I5kv
         QTyA==
X-Forwarded-Encrypted: i=1; AJvYcCVknOSpXRR1dXhbdK5s3vKm3N/UQM113N0i0NcWEMaD5DQNlK/L3CfsUy5ZHSdsLgI44WdPa8JOy46Sgw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtfo6OkVUxHF9XXHi+8l+w8B0Uf7ejZJNUBCG51bWP1Fv1vFD+
	FR8whd/iR2BaDaljsZ7gxNf0y8zA2wXBFZNl74MprMJ+19UG68Z5ZDgobUZlFGjXXoc=
X-Gm-Gg: ASbGncsgZtQvRyz4EkWujx5Fql9dd/R9Vr/+C+Vmt3Y/LuyVKe/FxWAiUQPeWz+wHXD
	LixnXSswPaj4RynAIyROmvQyEyZb6HW9HASqntcwlx5tkvXdBCr4RpaTufg4w8e2PxycUAHIg0A
	UPConB6mN4a79Eq2acMocoWE0i7GB9rCx4HKCGZz/2UACAlZcvwRUGm97QerKCrD6vrO5gpFfq/
	bB2atn/hsSl6AqEArOo407wsz0BdrRaVqiTPD0nMg46jjKtdmAcZlDfQxFo1xtEIqFYdR39wclS
	l94Y7GE2fSnKdYIan8307sekF/8CFouYXngQk9+PiFYCkNZUs89kW3c1w5IubcpwEfpFNpXvWdq
	S7zCKK/UARE1KaWIUesYZ586Y6ms7GrGNENlnbN770ZYyHPsWHJYK1/hMN6m+CiXhRtJOx5AAuj
	53rzDg0J9t+z2Lw1fJGLOhWIA2sUGx9qwf6WIG3ZSUsrRp4qKNtjXh
X-Google-Smtp-Source: AGHT+IHAcPLHZg6bWDyZGKpCbcZudLY6bYaoGTsYh6dE+C0Igma98JGLt6Qsc4L18+Bxn9oezOhieQ==
X-Received: by 2002:a05:600c:4f8b:b0:475:d8b3:a9d5 with SMTP id 5b1f17b1804b1-4792aeeb58cmr94509685e9.10.1764931185544;
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b02e84dsm56877255e9.4.2025.12.05.02.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 02:39:45 -0800 (PST)
Message-ID: <862de579-c7d8-4374-9090-cb42c5dda73a@linaro.org>
Date: Fri, 5 Dec 2025 10:39:43 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 7/8] media: qcom: camss: csiphy-3ph: C-PHY needs
 own lane configuration
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-7-6b35ef8b071e@ixit.cz>
 <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Language: en-US
In-Reply-To: <418e11df-1e17-46a7-813c-045a31d5c657@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2025 10:38, Bryan O'Donoghue wrote:
> and int.

*an int

---
bod
