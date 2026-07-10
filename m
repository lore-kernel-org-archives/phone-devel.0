Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774343BFE5B;
	Fri, 10 Jul 2026 09:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676750; cv=none; b=aVBTsstffRzFA5ylr9TD7xTD2VkU00GAt9S5UfL/Y+BEBGZ6/6BtMvm3X1od9w1/fmQ9E6H74Bfvju3tYQReSu3UsjQcooGoLDukjNgPE6g+IokPtCbjhGUwDRUUbrXPT7oFJujun3bzwWTrdKCFW3gVFiLtmD6K2TJ+pIrO2XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676750; c=relaxed/simple;
	bh=NAm4LlfByIXXQH9ExlzovVqLorloy/qQmxpgOiHsEYc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XVG6xH5bXsc9L2S175SuEmowgp4EpJKctKGs4b4UU+Dsaam89fodaiJs8hoQ4Aq6myQwFzhoQtGwqCFBG2daOsF5MtWJPo0Jn2tehCk6BA0zP8XlYlb/B84DH0E+uPkLPPCEAwpec7zy5Gt2BJSPzAWmRezgGW/b75muGTtFVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=YqN5FLKc; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="YqN5FLKc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1783676433; bh=NAm4LlfByIXXQH9ExlzovVqLorloy/qQmxpgOiHsEYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YqN5FLKc+K8IONv9KFKhPQIq4rWrTMuNj0x0vDMmwlz/upKnh/OCBgs4f202APgc3
	 EEaPaoQPxuZcIHTYLOOiM42L1mcSoA2ADZNLM0nMhBoNBkug5cZZWv/b+z0gNNNYSR
	 OEfVzjAux9HeLZASyUCPGEsZEALxvbf2jKhMhSW0=
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 11:40:33 +0200
From: Luca Weiss <luca@lucaweiss.eu>
To: federico@izzo.pro
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: fix ngd register base address
In-Reply-To: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
References: <20260709-qcom-ngd-register-base-fix-v1-1-5f7ab48f9209@izzo.pro>
Message-ID: <35a7f6d4da307dbd1eb2fffc255e0206@lucaweiss.eu>
X-Sender: luca@lucaweiss.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 2026-07-09 19:00, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> The slimbus controller register base was calculated using the
> controller ID and the register size, producing wrong results for ID > 
> 1.
> 
> The expression reduces to ngd->base = ctrl->base for controller with ID 
> = 1;
> but for ID > 1 the other factors produce a wrong base address.
> This bug caused a crash while trying to bring-up the secondary
> slimbus controller (ID = 3) on oneplus-enchilada with sdm845.
> 
> In practice, the correct base address for each slimbus controller can 
> be
> obtained from the device-tree, so there is no need for further
> calculations.
> 
> This was validated by reading the version register from the WCN3990 
> slim
> interface on oneplus-enchilada.
> 
> ---

Please remove the ---, otherwise your S-o-b will be dropped when 
applying the patch.

Also Fixes: ?

> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c 
> b/drivers/slimbus/qcom-ngd-ctrl.c
> index 80877e951849..91932f8d021b 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1547,8 +1547,7 @@ static int of_qcom_slim_ngd_register(struct 
> device *parent,
>  			kfree(ngd);
>  			return ret;
>  		}
> -		ngd->base = ctrl->base + ngd->id * data->offset +
> -					(ngd->id - 1) * data->size;
> +		ngd->base = ctrl->base + data->offset;
> 
>  		return 0;
>  	}
> 
> ---
> base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
> change-id: 20260709-qcom-ngd-register-base-fix-a59713a184b8
> 
> Best regards,
> --
> Federico Amedeo Izzo <federico@izzo.pro>
