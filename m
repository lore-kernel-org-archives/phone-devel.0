Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141933EC804
	for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 22:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790202335; cv=none; b=s/LN+BWeJ3snV4hacr5CYKz73JjHEV0ezMqIntDwJPltkFsbmeglVNSSK1PVFBRoIPcDQ94Azi5rseo0dD9iHrMq9CktjMLuSrI3BCeUqAjMxcAQxgVFPdy4R5+fPX36e75NflsT+DtTsHEjAxPIdCp+HE6eDUWD77rtWOZNrME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790202335; c=relaxed/simple;
	bh=Sq1ys/pcaUDWy4lVzStpIlZs0Pe2mQbVBLmjN5cJ418=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BpVnASBh03SAecoMFioPlDT9yO1VR215fohkXDiuSZxpp8LAgcjKN+nv6G+YsXM0XlJMFwREVnBhl5sjUR4haWbOaBpiHnN7+fRGzqUR6NxHpcyFnjE4jBT1PZx0ahhfH5niTeYTbX2BDVWR6CiClgwFbw63/C64e9vJPir6qvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ijtb7S1s; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ijtb7S1s"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48449f62b93so597950f8f.0
        for <phone-devel@vger.kernel.org>; Wed, 23 Sep 2026 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790202331; x=1790807131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D+jQCVrYZyXr3HsKGilur7CRVT4WUdAll7jn608CdBo=;
        b=Ijtb7S1sYCur//OBdjwx9HqUQSNq7hqdeNelc4Q+SYyfbwW0Ew7mA9l4FR3KzFiQ+t
         RbPNZ1EUNeP9KgxmvKbR7WOrrark0hfhmf3NvBmbWYg1GDCIcbrd+KJHJPYMome97cNK
         9jJezpIQQ2xVJoeKC37NegsiJFUPxbxpD0QTXlwSwNYlLNgwMCzPhydGs+Y/FxUxxqk6
         yElHbDM9NdVZlFmj+KnFUvX4Ul6LQonHQgc2ojVa0EjDfypnKAuboLWNUtBnUti0B7Dp
         HSf76+8ooOTRAn6Q+b1elKdVBo/hxr8DAD+xeAWvfLDjxdyZGuJd8aJ9MR8kcbqzla3u
         J9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790202331; x=1790807131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D+jQCVrYZyXr3HsKGilur7CRVT4WUdAll7jn608CdBo=;
        b=kzXK/iYoseQKhzF9TomMId+35KRb3ncwW0wIA8pXPOpEa7boOdtzXRAoB/YRJsV6/6
         XEWBXRnF3imNM9KBZThQrUMQH3osVybv8zuKg7eP+zHg5p+jaETRMq+SQjue6+D/wD9k
         W9HRZjA9QcjABmVYl6wOAEZBR80H/o/AJ/dGS1hjLTEMMhT+4E1V1V8UxfDpkfb6WYc6
         /IT4FAwLUuYffxKECQgQMtPTI0WZofziycewocFTo01QBkHuS3NKlekjCjb/vPjPc5MY
         3O8jvvs2y0XuLvw6ydaOwug1Fx00Qr7SIs80UJK0kEEQwVRJ3/jt8MkqaypX0F4KckUI
         +xbA==
X-Forwarded-Encrypted: i=1; AKwUvBwwBQw6/FldTbi4dvqWS4NtQpBuES7YgIdAglFx+W9cPA4u8/16yqV2I3q1VTHF3eZkQD3SxV02vjfOCw==@vger.kernel.org
X-Gm-Message-State: AFuF++lgqpIVWkDNL0c5zyxgZopJ1dF88VpiH7VMJsuZsuHdBLHhtPS7
	AoWF96xUudxwDi6YdtxJ07Fem334ulf0k8PX4GGS7yhPtDaScn0DdoIp
X-Gm-Gg: AYBFou3XdwaH8Qoxco/9dbvjKWkU+3BUJA0OMuJfu5rKZy5+SDIYy29EEjt8WsZFXOq
	hN9RfVIbZzN6if+roQNIhGsJKMYlKpgS6IWD/I2V1hObmBNB5FRDSDrFIFWYXx5hJV0ZbixW8Ex
	2gksN0f3DRa/oHbH1A0x79t3xLPewvUQXN212dn41X+lmabQ6V7MJGiDZSnNubXDevicdiK2jTX
	p4FZeWc7aZMfGSnElaXD97rUPlvyJ31pYABUEILefyo/Fzld8rUMj0D57UBS1QrCUNrI9lS/lLw
	K4LLu5QJ4W2kJ56O4NZoEzhC4S1vTQU23sfwhuQzH6w79E1cqtERffYGCdWlCmrpHVAt8iX0w2p
	OfWiYZnpEV9H1bTeUzq5v16eYh/MpVt2aFFmKpGKgFGDfliPwUlPHywI44tpw+TlX0lSzAEZslx
	F9LixlDIgb0RiTjQtljC98EH00CZLFktKmXu+ouDdrfJzRCefINbWBK6Vc/doLGvhQPg4+PxYPx
	RmD2JD0oRIHi3Jch27Dj55iED0RZAJVhg==
X-Received: by 2002:a5d:5f8c:0:b0:488:5589:d358 with SMTP id ffacd0b85a97d-488716ca7b6mr877328f8f.18.1790202330461;
        Wed, 23 Sep 2026 15:25:30 -0700 (PDT)
Received: from x230 (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877c379sm9726748f8f.29.2026.09.23.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 15:25:29 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: devnull+david.ixit.cz@kernel.org
Cc: abelvesa@kernel.org,
	airlied@gmail.com,
	andersson@kernel.org,
	conor+dt@kernel.org,
	david@ixit.cz,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dsankouski@gmail.com,
	jesszhan0024@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	phone-devel@vger.kernel.org,
	robh@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 09/11] arm64: dts: qcom: sdm845-samsung-starqltechn: Update
Date: Thu, 24 Sep 2026 00:25:20 +0200
Message-ID: <20260923222521.188197-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
References: <20260920-crosshatch-panel-v1-9-de6e9512da96@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> 
> Original compatible describing only the DDIC used, but omit describing
> the panel used (Samsung AMB577PX01), which we have no way to detect.
> 
> New compatible allows without breaking ABI fixing the inverted reset.
> 
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index bd59f1dcd96dc..c156ed3733b4e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -262,23 +262,23 @@ &mdss {
>  	status = "okay";
>  };
>  
>  &mdss_dsi0 {
>  	vdda-supply = <&vreg_l26a_1p2>;
>  	status = "okay";
>  
>  	panel@0 {
> -		compatible = "samsung,s6e3ha8";
> +		compatible = "samsung,s6e3ha8-amb577px01";

I guess that keeping the original "samsung,s6e3ha8" would cause that ABI break ABI, right?

compatible = "samsung,s6e3ha8-amb577px01", "samsung,s6e3ha8";

Anyway, LGTM.
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

>  		reg = <0>;
>  		vci-supply = <&s2dos05_ldo4>;
>  		vddr-supply = <&s2dos05_buck>;
>  		vdd3-supply = <&s2dos05_ldo1>;
>  		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>  		pinctrl-0 = <&dsi_default &dsi_te>;
>  		pinctrl-1 = <&dsi_suspend &dsi_te>;
>  		pinctrl-names = "default", "suspend";
>  
>  		port {
>  			panel_in: endpoint {
>  				remote-endpoint = <&mdss_dsi0_out>;
>  			};
> 
