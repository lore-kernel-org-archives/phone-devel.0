Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49ED27456;
	Mon, 24 Aug 2026 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787530194; cv=none; b=dg75IH1uZpKE+uA2xCzClWZfdHMvRj7eRjmciwrsQgJtn9RjIANDpNx/U9RwYZQa/Zm3IMbF+vZaKbmhZwkdPIyuUx9kgkd+1EsBZsPNGpX2xgZlyHA/x0Tg+PIgyB0OBaX1Y2r9f3JkJ4w0V56WmmlM1beMHjHp7RMN3Tgg7rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787530194; c=relaxed/simple;
	bh=jx9uYhNNan++1KD/AXC7uWqVMj8jXBPUiwFNhViFLc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ioSkmeTdttg4N0qqQA6QlOe/p5D/8zegQpNBcYc+9t279CEkXks0c/DEutDL/spZ9W4KzenTJPP2X2ZKNCZg/gQrFAKei0niNfrTINqmBeflRLUsKFujJNHqy70lOW0rong3tP/T0f0rxpFlHZRjAicf40LuDwzzpNe+6aOCUks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=klvMkSTN; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9SKGGN9Z; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="klvMkSTN";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9SKGGN9Z"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1787530189; bh=nqMIpiV4ml9Z0Gxbhq8j6/C
	b6wDm8IV57mcHdUFXe7Y=; b=klvMkSTNDSEzLYCdqZ3vF1iXE07B9TIA3kUQ9U9TXqKJPm+Zve
	e045kGApxoF70ZqitoPk8dpkcuThXRxqGxiRvNbUY3PxXUphqjhKDarbwq9CVlp+DoLJ4Dzotsy
	xh/WBlsFkdvKJB6iZlue2ZPplB6wOmiPgu7C9VJ04s2fCXOO6vI/de2t7zlBN7t8NyyE0b2cY2e
	0puBRZpYzpnHIqrJCm2CB/QgdxVv9fU1EjUGf0zCzdwKOImxrLMGqQT5xyAKhhQJCrhjIElKshj
	/DxWTPqSE2AwZfuwopD2R8ihRYySBzfMmKy8yrlvVAUWui4y0Log453DgCcGHY4IG0A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1787530189; bh=nqMIpiV4ml9Z0Gxbhq8j6/C
	b6wDm8IV57mcHdUFXe7Y=; b=9SKGGN9ZrgT+YVb4GoaoiNfvzvph6U/PnoO4eNXZuXIuIR/KG4
	oDDfbdk4zOrZMgmP7pm9AdujmOa9Xat27MBA==;
Message-ID: <9a2cf14e-244f-4a1c-9a65-8c3c1e77901a@mainlining.org>
Date: Mon, 24 Aug 2026 03:09:48 +0300
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: mux: fsa4480: wait after enabling supply
To: neko@altlinux.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260820-fsa4480-wait-for-power-v1-1-d13aa1bfac51@altlinux.org>
Content-Language: en-US
From: Danila Tikhonov <danila@mainlining.org>
In-Reply-To: <20260820-fsa4480-wait-for-power-v1-1-d13aa1bfac51@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Vasiliy,

On 20/08/2026 14:44, Vasiliy Doylov via B4 Relay wrote:
> From: Vasiliy Doylov <neko@altlinux.org>
>
> Add a 200 ms delay after enabling the optional vcc regulator in the
> FSA4480 probe function. On some platforms (nothing-spacewar) the supply
> needs time to stabilize before the chip is ready to respond to I2C reads.
> Without this delay the initial DEVICE_ID read fails with -ENODEV.
>
> Tested on: Nothing Phone (1) "sm7325-nothing-spacewar"
>
> Signed-off-by: Vasiliy Doylov <neko@altlinux.org>

Thanks!

Tested-by: Danila Tikhonov <danila@mainlining.org> # sm7325-nothing-spacewar

> ---
> Add a 200 ms delay after enabling the optional vcc regulator in the
> FSA4480 probe function. On some platforms (nothing-spacewar)
> the supply needs time to stabilize before the chip is ready to respond
> to I2C reads. Without this delay the initial DEVICE_ID read
> intermittently fails with -ENODEV, preventing the driver from binding.
> ---
>   drivers/usb/typec/mux/fsa4480.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fsa4480.c
> index bea0c1deec94..4dab12c2b9d7 100644
> --- a/drivers/usb/typec/mux/fsa4480.c
> +++ b/drivers/usb/typec/mux/fsa4480.c
> @@ -278,6 +278,8 @@ static int fsa4480_probe(struct i2c_client *client)
>   	if (ret && ret != -ENODEV)
>   		return dev_err_probe(dev, ret, "Failed to get regulator\n");
>   
> +	fsleep(200000);
> +
>   	ret = regmap_read(fsa->regmap, FSA4480_DEVICE_ID, &val);
>   	if (ret)
>   		return dev_err_probe(dev, -ENODEV, "FSA4480 not found\n");
>
> ---
> base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
> change-id: 20260820-fsa4480-wait-for-power-7ffdcd2bebbc
>
> Best regards,
> --
> Vasiliy Doylov <neko@altlinux.org>
>
-- 
Best regards,
Danila

