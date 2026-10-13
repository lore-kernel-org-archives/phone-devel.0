Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58649545D8C
	for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791923722; cv=none; b=R92/6GwOguc0nbF8sWa/iD53O4LYbc3fxmid6gsPh8R7e5g6tZArHqVte7j9bOWmAT5cOSubdedkfUXrTR5dI182GDzNEogyD8CxUfsHQNNMxBdtiBdCjr/FS5xWKa12tMM9n7Vpisq/6cdyYUbCu7IWu7C4yKt71CSVMdy0ULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791923722; c=relaxed/simple;
	bh=vSdc/GgrjZjvW48jrW3QLCyEw09wBJTQiSl8ktErzpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvM2awa3D8ehveTDFfSfVu4NQF+FHa+SqbN6uEUZJ0CquR54mrix8DdbSlUjmziHHpZ2X/NRfj5FbRAlvYk5zZcuhMEi9FQRdoCWHmiA1NQ8XRIKF0GRdHzFyYfxFqYBKvkRq+ddxB1S/PXGk6yOJwRURfikSVCKcNW8kty9Rj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M7fPW2U5; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M7fPW2U5"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so46355466b.1
        for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791923716; x=1792528516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=M7fPW2U5xkowbe9JGecB1W8oBSwTaatwVLPU6Ca8NWf/8LtAhGCVUY47N1sGnU4LPN
         wmrzive72wd55LYvsJurNfxl50fFgrWUwepkgVi6FwEm38FoBx2TN+y5/7Mlx45CJ5vF
         K7DSwRKMYT5vwprOYjtHaD0+3i008WW15L1BA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791923716; x=1792528516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LW10asy9KSTOiiqztGh47B9kXPqdbR7tUZT+37TKLvs=;
        b=oFxg/nzq1+opPQWKob4QXZXZ6OY7JsC0vLDIMm0XINPUXSkXd1JHkWimdHjDWbvtU4
         Kbyzug1/x4OhmRyrlAgC2NJSLvaQhNjpLf6yOhh1s6tnyWksUilfdK92gMqUUNa6muJS
         9NHzDr7qI/CTiAeEXprW0A0igp1sHXJ1bZ2zqX0pu3s3VwjCaj4g08XpjdrItuJTzZ8i
         mlR/O3Zw52JMfEGqit9/tyDze3oXK62yeRro0XcX4bXhw99MbJ0Vz2nfrUgI/SYR5QA/
         mEZ26yL2Tt8cuiCJi+uaK1R8azZ6N0J/ku41RtPeSdY2GYyqoDgUugPkvKtTAt8GXKNL
         1Adg==
X-Forwarded-Encrypted: i=1; AKwUvBwk1OQuQeNe+YsnxKWfR5cqRJyvGC3oxHmYsSV4II4dq3x2Uv4j45Nr4OOdd3Z1jeJVsNZ/vn3I/fraiA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPuzwjPi5S77YM3tLfEPVrP4mw7hIInWyx3hhH7p/w2Tf+Mpxg
	TJnWVx6uuMIcLvW1SL6K0P92KlF5fxnato8xaT8z5TTVSM4rvkgYstJcLlxMWb5gV8OsCJ2AbUd
	n+TtlUg==
X-Gm-Gg: AYBFou2mLOChUTrwjmD8TCCqoAg/he4vBPSj0GeRBaTzzuYGOrAQykJAfoRfBQiBm9E
	3Qy/5U70q3yzOih5h9OWDxLExAxPQDIQDI/HR2O5xlodr1dAKwjR6agja6MrkK9JnZeRcZLvJmg
	47fVeuDikAynelGc65LJlXhj18t3qoZ7ggg0y2bEm1phUGEYAUoGn7fzR9s+eQb0/3UAPR75vLL
	o+BScE18zGxwDqhw1mK4MeJYZarNmthNJ9KXZnqykFSujcRlolh/gXTk7eO/ByfklyftpD/7w0d
	xWfMEa/zqY39kAnSVmLJEG1+b1lRvqvmAERbZC4+gnab6bRFM4sUSwoM9DNiw8PFfTRc0ciJ2yc
	2lw4D9ljaQ73rbY7KqltE2V+RQdY9IAOuu1t2MIPlq7JsenFPI82SJJcNaAb7SX3WIdrNvh4rZA
	JzilJuz5X6XtqDPK4wFtQ+R6Fx1D+YoOqXFbm0n4M8EUK6ude2OJbGG9x97LaBxPDdLPP+++aHF
	OpASonqlKawOcpvMwnVTec2FUFafYALxzEajzs=
X-Received: by 2002:a17:907:60cd:b0:c2d:c8be:4e71 with SMTP id a640c23a62f3a-c31aa02468cmr1259563966b.19.1791923716533;
        Tue, 13 Oct 2026 13:35:16 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae4a94sm640287266b.82.2026.10.13.13.35.14
        for <phone-devel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 13:35:14 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48afe75f055so3101678f8f.2
        for <phone-devel@vger.kernel.org>; Tue, 13 Oct 2026 13:35:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQMSqGXEwoA8O6AsZyXrzczQ3EBIPHjTsQ8MxKa7w0peMVCOmhJUinBEL2sDedTz4f0MlwrdUGJNllxg==@vger.kernel.org
X-Received: by 2002:a5d:4b4c:0:b0:48b:f92:1f67 with SMTP id
 ffacd0b85a97d-48dbaae6d3cmr18389338f8f.21.1791923713788; Tue, 13 Oct 2026
 13:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com> <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-1-7188e7ea7a15@fairphone.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Oct 2026 13:35:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
X-Gm-Features: AclHuK_Kdnq_Nm7orMZLL2zoW1RgGH3OpgePi2fH32LmSKFmFT8VrWVBo8fW_FI
Message-ID: <CAD=FV=WVAnohGm8kmaLpfchk_MxCiUB8EcyyWBxZqtnc+9YPcg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, Jasper Korten <jja2000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 12, 2026 at 11:11=E2=80=AFAM Luca Weiss <luca.weiss@fairphone.c=
om> wrote:
>
> From: Jasper Korten <jja2000@gmail.com>
>
> Add an entry for the B140HAN04.0 eDP panel. It is found on the Samsung
> Galaxy Book2 Go.
>
> $ edid-decode /sys/class/drm/card0-eDP-1/edid
>
> 00 ff ff ff ff ff ff 00 06 af a9 65 00 00 00 00
> 28 20 01 04 a5 1f 11 78 02 9b 85 92 56 59 90 29
> 20 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
> 01 01 01 01 01 01 14 37 80 b8 70 38 24 40 10 10
> 3e 00 35 ae 10 00 00 18 00 00 00 0f 00 00 00 00
> 00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
> 55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
> 00 42 31 34 30 48 41 4e 30 34 2e 30 20 0a 00 ed
>
> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 2b455369ed70..73cdc2d37ab7 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1986,6 +1986,7 @@ static const struct edp_panel_entry edp_panels[] =
=3D {
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116X=
AN06.3"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140H=
AK02.7"),
>         EDP_PANEL_ENTRY('A', 'U', 'O', 0x643d, &delay_200_500_e50, "B140H=
AN06.4"),
> +       EDP_PANEL_ENTRY('A', 'U', 'O', 0x65a9, &delay_200_500_e50, "B140H=
AN04.0"),

I'd assume you don't have a datasheet here and that the timings are a
bit of a guess. It's nice if you put that in the commit message, but I
won't block it. Ideally you could reply here and let me know if you
referred to a datasheet or just made a guess about the timings so if
the question ever comes up later we can find the conversation based on
the Link: tag...

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[1/3] drm/panel-edp: Add AUO B140HAN04.0 panel entry
      commit: 9125232bc2a5020710db1eadd21973757f740648
