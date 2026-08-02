Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1B1DA0E1
	for <phone-devel@vger.kernel.org>; Sun,  2 Aug 2026 14:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785681060; cv=none; b=GzHXbZhAB+REkxrqXEgADppvnHb7YPaZnw/m0R2yfD5NdQEv8mqZjIWfTT0QVgwBl4y26hyfaeZIZqWkhc+L91sNNZgPxz6c8oUXVz3VAy/RsZIljWOT7IZQA8YKmJZnnYQcMxD4VFb9j42/6WTaPnM76cQEwFVrHQIECFexnCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785681060; c=relaxed/simple;
	bh=4Cw5hHEtwE4SsTUeNi0GjrPqFYX5d9lInGn6AgWbfuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LEbpENMkeVrq634Jd72TxUHW2OmQbLdBvbjca4w5IIZ0f4t0aE2l0a9qrSRB1u/Pi3ywY8Gccu8hfJMU0EDfJBTrOlFgmzWFGE0rnwZkZH4Te2MCroAhMFERK0gy7tQmPGc0GpyQhAEsUkFZkxprVT5nCKbwlLjlsIm1dxDbVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q7KExOPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKby09y0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q7KExOPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKby09y0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B7YrC1508151
	for <phone-devel@vger.kernel.org>; Sun, 2 Aug 2026 14:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2wLRb9QYeLt7rsVJiN7hvsyaizC8vPUiUfINQ6ZucSQ=; b=Q7KExOPD9xdKlaiR
	aHN5+/9FPnOhdkYRb54QhiHeJJ+JF6g2m/nrGHslEFdXpta7P3skcFQgcVWppdxQ
	grVsxUJz+rRWcglAnpKBVdNcUpGO9kCEjw6uEnSGhgdJETMSNlllIMxvKcQNrfIC
	EclpJ5WAF2KYeYN9rmzVUW53rptyB02YUKTUpkdwK+4/LxVZc6uY4WQIFHuSZLVo
	vVlgDjATtOwwdYcGUIinMg+9cLOG4oUTzRHGuOK/pejMZR8ZGHO/5Z4m5grmFTie
	44Ke/jjusXT65rp1h+j97rnJWdzTSGzDy++Rxvli0aG0IgPtHRi2NrzMTaBNbw+L
	U8haew==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9ayv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sun, 02 Aug 2026 14:30:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso6477396a12.2
        for <phone-devel@vger.kernel.org>; Sun, 02 Aug 2026 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785681056; x=1786285856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2wLRb9QYeLt7rsVJiN7hvsyaizC8vPUiUfINQ6ZucSQ=;
        b=JKby09y0wDxr8WUAGnj214enHIypTcq9V7oIm4NB6+f5BdYX9qlwvtbrt0ijsEs0rv
         wfJW7GsitssmRLgdQ9KEVrJZE3SdTeq0N3wQiw7JeZMFSiTIkMCX8ipJ+8PPDNaN5a0B
         +pRDjGGfffDqkK5ypcoCr4sbSkNLSLm95HwPCaBIjSoe99WLFWrlNC0ITJuuFGu+b4fB
         BiyYB0JRrXsvoHsrvdSJkEZaYWFyw407I/ij6VIAJ7MUae+iq4tMMn80l7RwFSA9AjyZ
         hXdGRO0yHdXN0ylwPEPa2rOMxuIrdRG2nXFvDZY1iNrVscf6xoe7JubJo2mSIGh2l2pf
         e84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785681056; x=1786285856;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wLRb9QYeLt7rsVJiN7hvsyaizC8vPUiUfINQ6ZucSQ=;
        b=hw3vtT9+V+nRO3sMmhXCLIr95P2jO2iVvMmpvQnk+k0NOBYNrL/4We5ZXD55Fe1qcE
         pf8Datc9DEVX0UiFmd4N8ktV6+pW23s8yxjGC3YotNKprjGvzLzG65xPvX31JA6cVta7
         DfBi0uhdrH7grCVOca9C0YbmywGhLhPw8aW/QKrPzgOg7dGVwel0HOl3GIjqOPAdAYSY
         QpLrT/lPyp9yaqBHDiauJPQxWb9TkOyFH3rdf//jO4og8MO+f2kw6WRf0xtI0Dt1Kp7+
         0XqPg2UsYjA2ZsXa6gQefkAlRild3XaW7P7sKw+KGy/I+NO9XIgBJO8aYJlxnM52St2s
         GTHw==
X-Forwarded-Encrypted: i=1; AHgh+Roztz/zIuIqwgI0FToO2laPsOU7sFKz/+OPIl8lau6dzCTEWFBgsLbr5lpCL1tUDkgdwNdabvUlzp8/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxikKFZU0aK9IvDt1R7MZgh5oaMy9emc1wNBYXIc3x9kthqZCry
	sCizAfE9DjZfeArRU2zJ2fzZ6ow+yW12V/y+FhOvf3Hli/o1TEpP5BxZDmZGtRa3cbANxC3KoM6
	ZbpGSF1vrHtqgBkVosl3RZiuwmFsRY94CXZgtXwF7V9zTGVc//EHGDA6yW9LeDU/dGA==
X-Gm-Gg: AR+sD10fD1mgjp9cMcq1gq/zDzadsr2LCrl/086PkmyWZ+ea39UYcCaM0X4bc73/LsG
	eJX6mRZ5isqfiZeqNKyfIIqceOZ2g9vovdv5XXTjZjr51BKhqnbWOAUYk+1Ekh/OeWp77bUSZ8W
	/huJj/9xo4pBwkEQXwOvGZoupMsw+ABL0tmLoACcRDq/nIUDOmZ1fwAkWE1/4y6IdbHmoJz9iG+
	pUjmpN5iLzF+S6FIxRgV1k1kKl2FDjLOLC/CJXGqURBrHwzStKhD7inHz0S6o8BxKoMGXTZ1GMq
	HBQlCdLIDs6wbQJwX3N01Tr7yUkeE6hGa7fIkJNUrvq9nVgHx9CLnJbqgP4psewA0T/pshZiQjn
	AWV8IXmIjrzNV3aYhYEcv8QB+539vPiMh1DNox8TX5YzFuYm0hPTAYjaIwqY=
X-Received: by 2002:a05:6a21:a04:b0:3c0:e6c3:224a with SMTP id adf61e73a8af0-3c92a85cbe3mr6691732637.37.1785681056457;
        Sun, 02 Aug 2026 07:30:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:a04:b0:3c0:e6c3:224a with SMTP id adf61e73a8af0-3c92a85cbe3mr6691704637.37.1785681056010;
        Sun, 02 Aug 2026 07:30:56 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm40316903eec.4.2026.08.02.07.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 07:30:55 -0700 (PDT)
Message-ID: <bdb87a52-80ba-4f74-94f1-cc01881e0c8a@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 07:30:53 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: rsi: Fix types to appease CFI
To: Stefan Hansson <newbie13xd@gmail.com>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Cc: Stefan Hansson <newbyte@postmarketos.org>
References: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260802-rsi-cfi-fix-v1-1-5821d2cb54ee@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lgCYFjVzIY_fmD56fnf9WAQxGJF3GReQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyOSBTYWx0ZWRfXzSFZLqvavpnj
 E7pDNqj3v/sdMT5Kd7JjQDrANfJi61Vo9sSWsf3xjeWT/6yo7N5KHakAVCjUU6I2VDfubavT1bc
 SZga8A8u6xJZT2XOOrB1HYGQdnyWohs2BnkixXwg14IhkSesqZYDMjnDGKeN0ypoNILTU3ry9/x
 9P41ZE/kr9TwnQwxIWq7lCYgVrE3WwLg2ETYrlIzUTh26isaICJwe2M1j5DYESLYsIvEEdIWSfV
 pv5Q4xnWoQtJxL+ow04a6kCp9N/TvXQzqZQUbqz1+lulWAy2q15EHSmD3l18N+0nLeScuzgJX2a
 kXvnp98tweXT6BkcN24eA+dxtNPgQvedo7Y0ZJHzdAwbVhQQYIxhj1kVYd229qn2bNGzhtfQ4DQ
 CqSiPPw+A87MCHV/LFkf6wLSXW3FDt8x1uPMwDos/DXsHoErG6B2dGlTM2LHFYEQxEqXEHAmx3R
 T72epkM4NBW4WHWXjyg==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a6f54a1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=90mh4GC2pPR358r5yh0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyOSBTYWx0ZWRfX/CpuLnhRow1K
 kUeufrsBVL/IRzK4c82U+aGw0zWM2SVVbby+v2qn29mIhrZ6qOwx8aDFiLj9PPemyzLuHDWP4gY
 82mogYbICvx/rXk+7b70fCasUXOT138=
X-Proofpoint-ORIG-GUID: lgCYFjVzIY_fmD56fnf9WAQxGJF3GReQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020129

On 8/2/2026 5:22 AM, Stefan Hansson wrote:
> Avoids errors like:
> 
>     CFI failure at kthread+0x124/0x1cc (target: rsi_coex_scheduler_thread+0x0/0x1b4 [redpine_91x]; expected type: 0x89fb613d)
> 
> As seen in the aforementioned error this was tested using the downstream
> redpine_91x driver found in the Librem 5's downstream source tree.
> However, it appears that this driver is a modified version of the rsi
> driver found in mainline Linux and as such I decided to port the changes
> here too.
> 
> Signed-off-by: Stefan Hansson <newbyte@postmarketos.org>

Having fixed a ton of these issues in the Qualcomm Android downstream driver I
was going to give my R-B, but I ran this through my ath.git patch acceptance
process and it flagged some issues, starting with:

WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email address mismatch:
'From: Stefan Hansson <newbie13xd@gmail.com>' != 'Signed-off-by: Stefan
Hansson <newbyte@postmarketos.org>'

There are also kernel-doc issues noted below

> @@ -246,12 +246,13 @@ EXPORT_SYMBOL_GPL(rsi_read_pkt);
>  /**
>   * rsi_tx_scheduler_thread() - This function is a kernel thread to send the
>   *			       packets to the device.
> - * @common: Pointer to the driver private structure.
> + * @data: Pointer to the driver private structure.
>   *
>   * Return: None.

Return: 0

>   */
> -static void rsi_tx_scheduler_thread(struct rsi_common *common)
> +static int rsi_tx_scheduler_thread(void *data)
>  {
> +	struct rsi_common *common = data;
>  	struct rsi_hw *adapter = common->priv;
>  	u32 timeout = EVENT_WAIT_FOREVER;
>  
...
> diff --git a/drivers/net/wireless/rsi/rsi_91x_usb_ops.c b/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
> index 25c2b232394a..513d2fdfb510 100644
> --- a/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
> +++ b/drivers/net/wireless/rsi/rsi_91x_usb_ops.c
> @@ -25,8 +25,9 @@

above here update the documentation: s/common/data/

Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 function parameter
'data' not described in 'rsi_usb_rx_thread'
Warning: drivers/net/wireless/rsi/rsi_91x_usb_ops.c:28 Excess function
parameter 'common' description in 'rsi_usb_rx_thread'

>   *
>   * Return: None.

Return: 0

>   */
> -void rsi_usb_rx_thread(struct rsi_common *common)
> +int rsi_usb_rx_thread(void *data)
>  {
> +	struct rsi_common *common = data;
>  	struct rsi_hw *adapter = common->priv;
>  	struct rsi_91x_usbdev *dev = adapter->rsi_dev;
>  	int status;
